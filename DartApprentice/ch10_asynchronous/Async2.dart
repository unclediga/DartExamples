Future<void> main() async {
  print("Before Future");
  int val2 = await getVal();  
  print('value = $val2');
  print("After Future");
}


Future<int> getVal() {
  return  Future<int>.delayed(
    Duration(seconds: 3),() => 42
  );
}