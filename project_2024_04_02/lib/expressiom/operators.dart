void main(){


//一旦你使用了运算符，就创建了表达式。下面是一些运算符表达式的示例：
  a++
  a + b
  a = b
  a == b
  c ? a : b
  a is T
//在 运算符表 中，运算符的优先级按先后排列，即第一行优先级最高，最后一行优先级最低，而同一行中，最左边的优先级最高，最右边的优先级最低。例如：% 运算符优先级高于 == ，而 == 高于 &&。根据优先级规则，那么意味着以下两行代码执行的效果相同：
  // Parentheses improve readability.
  if ((n % i == 0) && (d % i == 0)) ...

// Harder to read, but equivalent.
  if (n % i == 0 && d % i == 0) ...



  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder

  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');



  int a;
  int b;

  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a after b gets its value.
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a after b gets its value.
  assert(a != b); // -1 != 0


//要判断两个对象 x 和 y 是否表示相同的事物使用 == 即可。（在极少数情况下，可能需要使用 identical() 函数来确定两个对象是否完全相同）。下面是 == 运算符的一些规则：
//
// 当 x 和 y 同时为空时返回 true，而只有一个为空时返回 false。
//
// 返回对 x 调用 == 方法的结果，参数为 y。
//
// 下面的代码给出了每一种关系运算符的示例：
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);





  //可以使用 = 来赋值，同时也可以使用 ??= 来为值为 null 的变量赋值。
  // Assign value to a
  a = value;
// Assign value to b if b is null; otherwise, b stays the same
  b ??= value;






  //下面的例子展示了如何使用赋值以及复合赋值运算符：
  var a = 2; // Assign using =
  a *= 3; // Assign and multiply: a = a * 3
  assert(a == 6);




  //下面是使用逻辑表达式的示例：
  if (!done && (col == 0 || col == 3)) {
  // ...Do something...
  }



  //下面是使用按位和移位运算符的示例：
  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR

  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right

// Shift right example that results in different behavior on web
// because the operand value changes when masked to 32 bits:
  assert((-value >> 4) == -0x03);

  assert((value >>> 4) == 0x02); // Unsigned shift right
  assert((-value >>> 4) > 0); // Unsigned shift right


//Dart 有两个特殊的运算符可以用来替代 if-else 语句：
//
// 条件 ? 表达式 1 : 表达式 2
// 如果条件为 true，执行表达式 1并返回执行结果，否则执行表达式 2 并返回执行结果。
//
// 表达式 1 ?? 表达式 2
// 如果表达式 1 为非 null 则返回其值，否则执行表达式 2 并返回其值。
//
// 根据布尔表达式确定赋值时，请考虑使用 ? 和 :
//上述示例还可以写成至少下面两种不同的形式，只是不够简洁：
  // Slightly longer version uses ?: operator.
  String playerName(String? name) => name != null ? name : 'Guest';

// Very long version uses if-else statement.
  String playerName(String? name) {
  if (name != null) {
  return name;
  } else {
  return 'Guest';
  }
  }




  //级联运算符 (.., ?..) 可以让你在同一个对象上连续调用多个对象的变量或方法。
  //
  // 比如下面的代码：
  var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;


  var paint = Paint();
  paint.color = Colors.black;
  paint.strokeCap = StrokeCap.round;
  paint.strokeWidth = 5.0;



  querySelector('#confirm') // Get an object.
  ?..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView();


//上面的代码相当于：
  var button = querySelector('#confirm');
  button?.text = 'Confirm';
  button?.classes.add('important');
  button?.onClick.listen((e) => window.alert('Confirmed!'));
  button?.scrollIntoView();

//级联运算符可以嵌套，例如：
  final addressBook = (AddressBookBuilder()
  ..name = 'jenny'
  ..email = 'jenny@example.com'
  ..phone = (PhoneNumberBuilder()
  ..number = '415-555-0100'
  ..label = 'home')
      .build())
      .build();

//在返回对象的函数中谨慎使用级联操作符。例如，下面的代码是错误的：
  var sb = StringBuffer();
  sb.write('foo')
  ..write('bar'); // Error: method 'write' isn't defined for 'void'.
//上述代码中的 sb.write() 方法返回的是 void，返回值为 void 的方法则不能使用级联运算符。


}