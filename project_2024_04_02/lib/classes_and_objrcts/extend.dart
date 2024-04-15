//使用 extends 关键字来创建一个子类，并可使用 super 关键字引用一个父类：
class Television {
  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
// ···
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
// ···
}



//子类可以重写父类的实例方法（包括 操作符）、 Getter 以及 Setter 方法。你可以使用 @override 注解来表示你重写了一个成员：
class Television {
  // ···
  set contrast(int value) {...}
}

class SmartTelevision extends Television {
  @override
  set contrast(num value) {...}
// ···
}
//你可以使用 covariant 关键字 来缩小代码中那些符合 类型安全 的方法参数或实例变量的类型。
//
//如果重写 == 操作符，必须同时重写对象 hashCode 的 Getter 方法。你可以查阅 实现映射键 获取更多关于重写的 == 和 hashCode 的例子。




//如果调用了对象上不存在的方法或实例变量将会触发 noSuchMethod 方法，你可以重写 noSuchMethod 方法来追踪和记录这一行为：
class A {
  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: '
        '${invocation.memberName}');
  }
}
//只有下面其中一个条件成立时，你才能调用一个未实现的方法：
//
// 接收方是静态的 dynamic 类型。
//
// 接收方具有静态类型，定义了未实现的方法（抽象亦可），并且接收方的动态类型实现了 noSuchMethod 方法且具体的实现与 Object 中的不同。
