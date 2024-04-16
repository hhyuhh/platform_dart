import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

// 定义一个 RemoteError 类，用于处理远程错误
class RemoteError {
  final String message;
  final String details;

  RemoteError(this.message, this.details);

  @override
  String toString() {
    return 'RemoteError: $message\nDetails: $details';
  }
}

// 定义 Worker 类
class Worker {
  final SendPort _commands; // 发送命令的端口
  final ReceivePort _responses; // 接收响应的端口
  final Map<int, Completer<Object?>> _activeRequests = {}; // 存储活动请求的 Map
  int _idCounter = 0; // 用于生成请求 ID 的计数器
  bool _closed = false; // 是否关闭端口的标志

  // Worker 构造函数
  Worker._(this._responses, this._commands) {
    // 监听来自主隔离的响应
    _responses.listen(_handleResponsesFromIsolate);
  }

  // 发送 JSON 消息到工作隔离，返回 Future 结果
  Future<Object?> parseJson(String message) async {
    if (_closed) throw StateError('Closed'); // 检查端口是否关闭
    final completer = Completer<Object?>.sync();
    final id = _idCounter++;
    _activeRequests[id] = completer;
    _commands.send((id, message)); // 发送带有 ID 的消息
    return await completer.future;
  }

  // 处理来自工作隔离的响应
  void _handleResponsesFromIsolate(dynamic message) {
    final (int id, Object? response) = message as (int, Object?);
    final completer = _activeRequests.remove(id)!;

    if (response is RemoteError) {
      completer.completeError(response); // 如果是远程错误，完成异常
    } else {
      completer.complete(response); // 否则完成响应
    }
  }

  // 关闭端口
  void close() {
    if (!_closed) {
      _closed = true;
      _commands.send('shutdown'); // 发送关闭命令
      if (_activeRequests.isEmpty) _responses.close(); // 如果没有活动请求，则关闭响应端口
      print('--- port closed --- ');
    }
  }

  // 创建工作隔离并返回 Worker 实例
  static Future<Worker> spawn() async {
    // 创建一个接收端口和初始消息处理程序
    final initPort = RawReceivePort();
    final connection = Completer<(ReceivePort, SendPort)>.sync();
    initPort.handler = (initialMessage) {
      final commandPort = initialMessage as SendPort;
      connection.complete((
      ReceivePort.fromRawReceivePort(initPort),
      commandPort,
      ));
    };

    // 尝试生成工作隔离
    try {
      await Isolate.spawn(_startRemoteIsolate, initPort.sendPort);
    } on Object {
      initPort.close();
      rethrow;
    }

    // 等待连接完成，并解构接收端口和发送端口
    final (ReceivePort receivePort, SendPort sendPort) =
    await connection.future;

    // 返回 Worker 实例
    return Worker._(sendPort, receivePort);
  }

  // 初始化工作隔离的入口点，设置通信端口
  static void _startRemoteIsolate(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort); // 发送接收端口的发送端口

    // 添加消息处理程序
    _handleCommandsToIsolate(receivePort, sendPort);
  }

  // 处理来自主隔离的命令
  static void _handleCommandsToIsolate(
      ReceivePort receivePort,
      SendPort sendPort,
      ) {
    receivePort.listen((message) {
      // 如果消息是 "shutdown"，关闭接收端口并返回
      if (message == 'shutdown') {
        receivePort.close();
        return;
      }
      // 否则，解构消息并尝试解析 JSON
      final (int id, String jsonText) = message as (int, String);
      try {
        final jsonData = jsonDecode(jsonText);
        sendPort.send((id, jsonData)); // 发送解析后的 JSON 数据
      } catch (e) {
        sendPort.send((id, RemoteError(e.toString(), ''))); // 发送远程错误
      }
    });
  }
}

// 主函数
void main() async {
  const String filename = 'with_keys.json';

  // 生成 Worker 实例
  final worker = await Worker.spawn();

  try {
    // 读取 JSON 数据并发送到工作隔离解析
    final jsonData = await worker.parseJson(await File(filename).readAsString());
    // 使用解析后的数据
    print('Number of JSON keys: ${(jsonData as Map<String, dynamic>).length}');
  } catch (e) {
    print('Error occurred: $e');
  } finally {
    // 关闭 Worker 实例
    worker.close();
  }
}