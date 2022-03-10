
void main(){
  print("Before Future");
  final myF = Future<int>.delayed(
    Duration(seconds: 3),() => 42
  ).then( 
          (value) => print("Value=$value")
  ).catchError(
          (error) => print("Error=$error")
  ).whenComplete(
          () => print('Future is complete')
  );
          
  print("After Future");
}
