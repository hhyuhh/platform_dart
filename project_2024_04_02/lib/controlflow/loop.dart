

//你可以使用标准的 for 循环进行迭代。例如：
var message = StringBuffer('Dart is fun');
for (var i = 0; i < 5; i++) {
message.write('!');
}



//在 Dart 语言中，for 循环中的闭包会自动捕获循环的 索引值 以避免 JavaScript 中一些常见的陷阱。假设有如下代码：
var callbacks = [];
for (var i = 0; i < 2; i++) {
callbacks.add(() => print(i));
}

for (final c in callbacks) {
c();
}


//上述代码执行后会输出 0 和 1，但是如果在 JavaScript 中执行同样的代码则会输出两个 2。
//
// 如果要遍历的对象是一个可迭代对象（例如 List 或 Set），并且你不需要知道当前的遍历索引，则可以使用 for-in 方法进行遍历
for (final candidate in candidates) {
candidate.interview();
}







for (final Candidate(:name, :yearsExperience) in candidates) {
print('$name has $yearsExperience of experience.');
}



//可迭代对象同时可以使用 forEach()方法作为另一种选择：
var collection = [1, 2, 3];
collection.forEach(print); // 1 2 3


//while 循环会在执行循环体前先判断条件：
while (!isDone()) {
doSomething();
}





//do-while 循环则会 先执行一遍循环体 再判断条件：
do {
printLine();
} while (!atEndOfPage());






//使用 break 可以中断循环：
while (true) {
if (shutDownRequested()) break;
processIncomingRequests();
}

//使用 continue 可以跳过本次循环直接进入下一次循环：
for (int i = 0; i < candidates.length; i++) {
var candidate = candidates[i];
if (candidate.yearsExperience < 5) {
continue;
}
candidate.interview();
}






//如果你正在使用诸如 List 或 Set 之类的 Iterable 对象，你可以用以下方式重写上述例子:
candidates
    .where((c) => c.yearsExperience >= 5)
    .forEach((c) => c.interview());