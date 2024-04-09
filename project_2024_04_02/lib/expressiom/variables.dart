void main() {
  var name = 'Bob';
  Object name = 'Bob';
  String name = 'Bob';
  String? name // Nullable type. Can be `null` or string.

  String name // Non-nullable type. Cannot be `null` but can be string.


  int? lineCount;
  assert(lineCount == null);

  int lineCount = 0;


  int lineCount;

  if (weLikeToCount) {
    lineCount = countLines();
  } else {
    lineCount = 0;
  }

  print(lineCount);


  late String description;

  void main() {
    description = 'Feijoada!';
    print(description);
  }


  // This is the program's only call to readThermometer().
  late String temperature = readThermometer(); // Lazily initialized.


  final name = 'Bob'; // Without a type annotation
  final String nickname = 'Bobby';


  name = 'Alice'; // Error: a final variable can only be set once.


  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere


  var foo = const [];
  final bar = const [];
  const baz = []; // Equivalent to `const []`


  foo = [1, 2, 3]; // Was const []


  baz = [42]; // Error: Constant variables can't be assigned a value.


  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: 'int'}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.
}