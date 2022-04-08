import 'dart:io';
import 'dart:convert';

Stream<double?> expenses(){
  return File("expenses.cvs")
                .openRead()
		.map(utf8.decode)
		.transform(const LineSplitter())
                .map((d) => double.tryParse(d));	
}



void main(){
  print("Expenses for Period:");
  expenses().listen((a){
     print("exp:$a");
  });
}