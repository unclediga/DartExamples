Future<void> main() async {

  print("Before Future");
  int? val2 = null;
  try{
    val2 = await getVal();  
  }catch(error){
    print(error);
  }finally{
    print("Feature is complete");
  }
  print('value = $val2');



  try{
    int val2 = await getVal(true);  
  }catch(error){
    print(error);
  }finally{
    print("Feature is complete");
  }


  print("After Future");
}


Future<int> getVal([bool reg = false]) {
  if(reg){
     throw Exception("Exc to you!");
  } else {
    return  Future<int>.delayed(
      Duration(seconds: 3),() => 42
    );
  }
}