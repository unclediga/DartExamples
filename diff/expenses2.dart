import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;


Stream<double> expensesFromList(){

//  final client = http.Client();
//  final expenses = client.get(Uri.parse("https://raw.githubusercontent.com/dzolotov/flutter-linux/main/expenses.csv"));

/*  
  return File("expenses.cvs")
                .openRead()
		.map(utf8.decode)
		.transform(const LineSplitter())
                .map((d) => double.tryParse(d));	
*/
  return Stream.fromIterable(List.of([1,2,3,4]));

}



Stream<double> expensesFromUri() async*{
  
  final client = http.Client();
  final resp = await client.get(Uri.parse("https://raw.githubusercontent.com/dzolotov/flutter-linux/main/expenses.csv"));
  
  print("response body is : ------------------------");
  print(resp.body);
  print("-------------------------------------------");

  for (final double v in LineSplitter().convert(resp.body).map((l) => (double.tryParse(l) ?? 0.0))) {
    yield v;
  };    
//  client.close();
}

void main(){

  print("Test Expenses from List:");

  (expensesFromList()).listen((a){
     print("exp:$a");
  });

  print("Expenses for Period:");
  (expensesFromUri()).listen( (a) => print("exp:$a") );

}