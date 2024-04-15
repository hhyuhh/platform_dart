//对象的 成员 由函数和数据（即 方法 和 实例变量）组成。方法的 调用 要通过对象来完成，这种方式可以访问对象的函数和数据。
// 使用（.）来访问对象的实例变量或方法：
var p = Point(2, 2);

// Get the value of y.
assert(p.y == 2);

// Invoke distanceTo() on p.
double distance = p.distanceTo(Point(4, 4));
//使用 ?. 代替 . 可以避免因为左边表达式为 null 而导致的问题：
// If p is non-null, set a variable equal to its y value.
var a = p?.y;




//可以使用 构造函数 来创建一个对象。构造函数的命名方式可以为 类名 或 类名 . 标识符 的形式。例如下述代码分别使用 Point() 和 Point.fromJson() 两种构造器创建了 Point 对象：
var p1 = Point(2, 2);
var p2 = Point.fromJson({'x': 1, 'y': 2});
//以下代码具有相同的效果，但是构造函数名前面的的 new 关键字是可选的：
var p1 = new Point(2, 2);
var p2 = new Point.fromJson({'x': 1, 'y': 2});
//一些类提供了常量构造函数。使用常量构造函数，在构造函数名之前加 const 关键字，来创建编译时常量时：
var p = const ImmutablePoint(2, 2);
//两个使用相同构造函数相同参数值构造的编译时常量是同一个对象：
var a = const ImmutablePoint(1, 1);
var b = const ImmutablePoint(1, 1);

assert(identical(a, b)); // They are the same instance!
//在 常量上下文 场景中，你可以省略掉构造函数或字面量前的 const 关键字。例如下面的例子中我们创建了一个常量 Map：
// Lots of const keywords here.
const pointAndLine = const {
'point': const [const ImmutablePoint(0, 0)],
'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
};
//根据上下文，你可以只保留第一个 const 关键字，其余的全部省略：
// Only one const, which establishes the constant context.
const pointAndLine = {
'point': [ImmutablePoint(0, 0)],
'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
};
//但是如果无法根据上下文判断是否可以省略 const，则不能省略掉 const 关键字，否则将会创建一个 非常量对象 例如：
var a = const ImmutablePoint(1, 1); // Creates a constant
var b = ImmutablePoint(1, 1); // Does NOT create a constant

assert(!identical(a, b)); // NOT the same instance!





//获取对象的类型
// 可以使用 Object 对象的 runtimeType 属性在运行时获取一个对象的类型，该对象类型是 Type 的实例。
print('The type of a is ${a.runtimeType}');






//实例变量
// 下面是声明实例变量的示例：
class Point {
double? x; // Declare instance variable x, initially null.
double? y; // Declare y, initially null.
double z = 0; // Declare z, initially 0.
}
//所有未初始化的实例变量其值均为 null。
//
// 所有实例变量均会隐式地声明一个 Getter 方法。非终值的实例变量和 late final 声明但未声明初始化的实例变量还会隐式地声明一个 Setter 方法。
//
// 如果你在实例中声明了没有 late 修饰的变量，它会在实例初始化时早于构造方法进行赋值。因此，没有使用 late修饰的变量无法访问到 this。
class Point {
double? x; // Declare instance variable x, initially null.
double? y; // Declare y, initially null.
}

void main() {
var point = Point();
point.x = 4; // Use the setter method for x.
assert(point.x == 4); // Use the getter method for x.
assert(point.y == null); // Values default to null.
}


//在声明的非late实例变量处初始化它会在实例创建时、构造函数及其初始值设定项列表执行之前设置该值。
double initialX = 1.5;

class Point {
// OK, can access declarations that do not depend on `this`:
double? x = initialX;

// ERROR, can't access `this` in non-`late` initializer:
double? y = this.x;

// OK, can access `this` in `late` initializer:
late double? z = this.x;

// OK, `this.fieldName` is a parameter declaration, not an expression:
Point(this.x, this.y);
}

//实例变量可以是final，在这种情况下它们必须只设置一次。使用构造函数参数或构造函数的初始值设定项列表在声明时初始化final非实例变量
class ProfileMark {
final String name;
final DateTime start = DateTime.now();

ProfileMark(this.name);
ProfileMark.unnamed() : name = '';
}

//每个类都隐式定义一个接口，其中包含该类及其实现的任何接口的所有实例成员。如果要创建一个支持类 B 的 API 的类 A，但不继承 B 的实现，则类 A 应该实现 B 接口。
//
// 类通过在 implements子句中声明一个或多个接口，然后提供接口所需的 API 来实现它们。
// A person. The implicit interface contains greet().
class Person {
// In the interface, but visible only in this library.
final String _name;

// Not in the interface, since this is a constructor.
Person(this._name);

// In the interface.
String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
String get _name => '';

String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

void main() {
print(greetBob(Person('Kathy')));
print(greetBob(Impostor()));
}
//下面是指定一个类实现多个接口的示例：
class Point implements Comparable, Location {...}
//使用static关键字来实现类范围的变量和方法。
//
// 静态变量
// #
// 静态变量（类变量）对于类范围的状态和常量很有用：
class Queue {
static const initialCapacity = 16;
// ···
}

void main() {
assert(Queue.initialCapacity == 16);
}
//静态变量在使用之前不会被初始化。
//静态方法
// #
// 静态方法（类方法）不对实例进行操作，因此无法访问this.然而，它们确实可以访问静态变量。如以下示例所示，您可以直接在类上调用静态方法：
import 'dart:math';

class Point {
double x, y;
Point(this.x, this.y);

static double distanceBetween(Point a, Point b) {
var dx = a.x - b.x;
var dy = a.y - b.y;
return sqrt(dx * dx + dy * dy);
}
}

void main() {
var a = Point(2, 2);
var b = Point(4, 4);
var distance = Point.distanceBetween(a, b);
assert(2.8 < distance && distance < 2.9);
print(distance);
}
