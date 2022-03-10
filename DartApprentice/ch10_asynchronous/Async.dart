
Future<void> main() async{
  print("Before Future");
  
  int value = await Future<int>.delayed(
    Duration(seconds: 3),() => 42
  );
  print('value = $value');
  print("After Future");
}


