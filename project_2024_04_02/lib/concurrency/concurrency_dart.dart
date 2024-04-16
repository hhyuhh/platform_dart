import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

// 异步函数：读取文件内容
Future<String> _readFileAsync(String filename) {
  final file = File(filename);

  // .readAsString() 返回一个 Future。
  // .then() 注册一个回调函数，用于在 `readAsString` 解析完毕时执行。
  return file.readAsString().then((contents) {
    return contents.trim();
  });
}

// 主函数：异步方式读取文件内容并处理数据
void main() async {
  // 读取文件数据。
  final fileData = await _readFileAsync('with_keys.json');
  final jsonData = jsonDecode(fileData);

  // 使用读取的数据。
  print('JSON 键的数量：${jsonData.length}');
}

// 同步函数：读取文件内容
String _readFileSync() {
  final file = File(filename);
  final contents = file.readAsStringSync();
  return contents.trim();
}

// 异步函数：读取文件内容
Future<String> _readFileAsync() async {
  final file = File(filename);
  final contents = await file.readAsString();
  return contents.trim();
}

// 异步函数：从流中累加值并返回累加结果的流
Stream<int> sumStream(Stream<int> stream) async* {
  var sum = 0;
  await for (final value in stream) {
    yield sum += value;
  }
}

// 计算斐波那契数列的第 40 个数（阻塞当前隔离）
void fib40() async {
  var result = await Isolate.run(() => slowFib(40));
  print('Fib(40) = $result');
}

// 计算斐波那契数列的第 n 个数
int slowFib(int n) => n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);

// 异步函数：读取文件内容并处理数据
void readFileAndProcessData() async {
  final fileData = await _readFileAsync();
  final jsonData = jsonDecode(fileData);

  print('JSON 键的数量：${jsonData.length}');
}

// 异步函数：处理文件读取结果
Future<void> processFileReadResult() async {
  final fileData = await _readFileAsync();
  final jsonData = jsonDecode(fileData);

  print('JSON 键的数量：${jsonData.length}');
}

// 异步函数：执行计算任务
void performCalculation() async {
  final result = await Isolate.run<int>(() => slowFib(40));
  print('Fibonacci(40) = $result');
}

// 主函数：异步执行计算任务
void main() async {
  await performCalculation();
}

// 异步函数：创建后台计算任务
void createBackgroundTask() async {
  await Isolate.spawn(_backgroundTask, 'data');
}

// 后台计算任务
void _backgroundTask(String message) {
  print('Background task started with message: $message');
}

// 异步函数：创建后台计算任务
void createBackgroundTask() async {
  await Isolate.spawn(_backgroundTask, 'data');
}

// 后台计算任务
void _backgroundTask(String message) {
  print('Background task started with message: $message');
}

// 异步函数：创建后台计算任务
void createBackgroundTask() async {
  await Isolate.spawn(_backgroundTask, 'data');
}

// 后台计算任务
void _backgroundTask(String message) {
  print('Background task started with message: $message');
}