var message = StringBuffer('Dart is fun');
for (var i = 0; i < 5; i++) {
message.write('!');
}




var callbacks = [];
for (var i = 0; i < 2; i++) {
callbacks.add(() => print(i));
}

for (final c in callbacks) {
c();
}



for (final candidate in candidates) {
candidate.interview();
}







for (final Candidate(:name, :yearsExperience) in candidates) {
print('$name has $yearsExperience of experience.');
}




var collection = [1, 2, 3];
collection.forEach(print); // 1 2 3




while (!isDone()) {
doSomething();
}






do {
printLine();
} while (!atEndOfPage());







while (true) {
if (shutDownRequested()) break;
processIncomingRequests();
}


for (int i = 0; i < candidates.length; i++) {
var candidate = candidates[i];
if (candidate.yearsExperience < 5) {
continue;
}
candidate.interview();
}







candidates
    .where((c) => c.yearsExperience >= 5)
    .forEach((c) => c.interview());