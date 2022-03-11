void main(List<String> arguments) {
  
  const a = 1;
//  a = 2;   Error: Can't assign to the const variable 'a'.

  final b;
  b = 2;
//  b = 3;   Error: Final variable 'b' might already be assigned at this point.


  num myNumber = 3.14;
  print("num $myNumber is double:" + (myNumber is double).toString());
  print("num $myNumber is int:" + (myNumber is int).toString());
  
  print("double $myNumber to int " + myNumber.toStringAsFixed(1));  

  print("double $myNumber to int " + myNumber.toStringAsFixed(1));  
  print("toInt() => " + myNumber.toInt().toString());
  
//  double n = (3 as double); Unhandled exception:
//                               type 'int' is not a subtype of type 'double' in type cast

  double n = (3).toDouble();
  n = 3;
  print('as double => ' + n.toString());   
  
  print('Hello world!');
  
  double d1  = 3.14;
  int i1 = 40;

  // type 'double' is not a subtype of type 'int' in type cast
  // print("init: double ${d1 as int}  int $i1"); 
   print("init: double ${d1} toInt ${d1.toInt()}"); 
  

  //////////////////////////// STRING ////////////////////////////////

  const oneLine = 'This is'
 ' only on line'
 ' in runtime';


  const oneLine2 = 'This is' + ' only on line' +  ' in runtime';

  const threeLines = 'This is\n' 'three line\n' +  'in runtime';


  print(oneLine);
  print(oneLine2);
  print(threeLines);
  
  print('I \u2764 Dart\u0021');
  
  print('I love \u{1F3AF}');
  
  final ily = 'I love \u{1F3AF}';
  
  print('"cafe" as runes is ${"cafe".runes}');
  print('"$ily" as runes is ${ily.runes}');


  ////////////////////////// DYNAMIC TYPES /////////////////////////

  var dyno = 10;
  // dyno = "assa";   Error: A value of type 'String' can't be assigned to a variable of type 'int'.

  var dyno2;
  dyno2 = "assa";
  dyno2 = 100500;  

  Object? dyno3 = 42;
  dyno3 = 'a';

  dynamic dyno4 = 25;
  dyno4 = 'b';

 





   
}
