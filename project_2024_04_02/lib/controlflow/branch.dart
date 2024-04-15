//Dart 支持 if - else 语句，其中 else 是可选的，比如下面的例子。
if (isRaining()) {
you.bringRainCoat();
} else if (isSnowing()) {
you.wearJacket();
} else {
car.putTopDown();
}
//Dart 的 if 语句中的条件必须是布尔值而不能为其它类型。






if (pair case [int x, int y]) return Point(x, y);



if (pair case [int x, int y]) {
print('Was coordinate array $x,$y');
} else {
throw FormatException('Invalid coordinates.');
}



//Switch 语句在 Dart 中使用 == 来比较整数、字符串或编译时常量，比较的两个对象必须是同一个类型且不能是子类并且没有重写 == 操作符。 枚举类型非常适合在 Switch 语句中使用。
//
//Dart 中的 Switch 语句仅适用于有限的情况，比如使用解释器和扫描器的场景。
//每一个非空的 case 子句都必须有一个 break 语句，也可以通过 continue、throw 或者 return 来结束非空 case 语句。
//
// 不匹配任何 case 语句的情况下，会执行 default 子句中的代码：
var command = 'OPEN';
switch (command) {
case 'CLOSED':
executeClosed();
case 'PENDING':
executePending();
case 'APPROVED':
executeApproved();
case 'DENIED':
executeDenied();
case 'OPEN':
executeOpen();
default:
executeUnknown();
}





switch (command) {
case 'OPEN':
executeOpen();
continue newCase; // Continues executing at the newCase label.

case 'DENIED': // Empty case falls through.
case 'CLOSED':
executeClosed(); // Runs for both DENIED and CLOSED,

newCase:
case 'PENDING':
executeNowClosed(); // Runs for both OPEN and PENDING.
}





var x = switch (y) { ... };

print(switch (x) { ... });

return switch (x) { ... };





// Where slash, star, comma, semicolon, etc., are constant variables...
switch (charCode) {
case slash || star || plus || minus: // Logical-or pattern
token = operator(charCode);
case comma || semicolon: // Logical-or pattern
token = punctuation(charCode);
case >= digit0 && <= digit9: // Relational and logical-and patterns
token = number();
default:
throw FormatException('Invalid');
}



token = switch (charCode) {
slash || star || plus || minus => operator(charCode),
comma || semicolon => punctuation(charCode),
>= digit0 && <= digit9 => number(),
_ => throw FormatException('Invalid')
};



// Non-exhaustive switch on bool?, missing case to match null possibility:
switch (nullableBool) {
case true:
print('yes');
case false:
print('no');
}



sealed class Shape {}

class Square implements Shape {
final double length;
Square(this.length);
}

class Circle implements Shape {
final double radius;
Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {
Square(length: var l) => l * l,
Circle(radius: var r) => math.pi * r * r
};



// Switch statement:
switch (something) {
case somePattern when some || boolean || expression:
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
body;
}

// Switch expression:
var value = switch (something) {
somePattern when some || boolean || expression => body,
//               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
}

// If-case statement:
if (something case somePattern when some || boolean || expression) {
//                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
body;
}




