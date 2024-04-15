//Dart 中的列表字面量是由逗号分隔的一串表达式或值并以方括号 ([]) 包裹而组成的。下面是一个 Dart List 的示例：
var list = [1, 2, 3];

//你可以在 Dart 的集合类型的最后一个项目后添加逗号。这个尾随逗号并不会影响集合，但它能有效避免「复制粘贴」的错误。
var list = [
  'Car',
  'Boat',
  'Plane',
];




//List 的下标索引从 0 开始，第一个元素的下标为 0，最后一个元素的下标为 list.length - 1。你可以像 JavaScript 中的用法那样获取 Dart 中 List 的长度以及元素：
var list = [1, 2, 3];
assert(list.length == 3);
assert(list[1] == 2);

list[1] = 1;
assert(list[1] == 1);

//在 List 字面量前添加 const 关键字会创建一个编译时常量：
var constantList = const [1, 2, 3];
// constantList[1] = 1; // This line will cause an error.



//在 Dart 中，set 是一组特定元素的无序集合。 Dart 支持的集合由集合的字面量和 Set 类提供。
//
// 下面是使用 Set 字面量来创建一个 Set 集合的方法：
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};



//可以使用在 {} 前加上类型参数的方式创建一个空的 Set，或者将 {} 赋值给一个 Set 类型的变量：
var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.





//使用 add() 方法或 addAll() 方法向已存在的 Set 中添加项目：
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);



//使用 .length 可以获取 Set 中元素的数量：
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);
assert(elements.length == 5);




//可以在 Set 变量前添加 const 关键字创建一个 Set 编译时常量：
final constantSet = const {
'fluorine',
'chlorine',
'bromine',
'iodine',
'astatine',
};
// constantSet.add('helium'); // This line will cause an error.




//通常来说，Map 是用来关联 keys 和 values 的对象。其中键和值都可以是任何类型的对象。每个 键 只能出现一次但是 值 可以重复出现多次。 Dart 中 Map 提供了 Map 字面量以及 Map 类型两种形式的 Map。

//下面是一对使用 Map 字面量创建 Map 的例子：

var gifts = {
// Key:    Value
'first': 'partridge',
'second': 'turtledoves',
'fifth': 'golden rings'
};

var nobleGases = {
2: 'helium',
10: 'neon',
18: 'argon',
};




//你也可以使用 Map 的构造器创建 Map：
var gifts = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var nobleGases = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';


//向现有的 Map 中添加键值对与 JavaScript 的操作类似：
var gifts = {'first': 'partridge'};
gifts['fourth'] = 'calling birds'; // Add a key-value pair



//从一个 Map 中获取一个值的操作也与 JavaScript 类似：
var gifts = {'first': 'partridge'};
assert(gifts['first'] == 'partridge');


//如果检索的 Key 不存在于 Map 中则会返回一个 null：
var gifts = {'first': 'partridge'};
assert(gifts['fifth'] == null);

//使用 .length 可以获取 Map 中键值对的数量：
var gifts = {'first': 'partridge'};
gifts['fourth'] = 'calling birds';
assert(gifts.length == 2);


//在一个 Map 字面量前添加 const 关键字可以创建一个 Map 编译时常量：
final constantMap = const {
2: 'helium',
10: 'neon',
18: 'argon',
};

// constantMap[2] = 'Helium'; // This line will cause an error.



var list = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);


var list2 = [0, ...?list];
assert(list2.length == 1);


var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];


var nav = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];


var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');