import 'dart:io';

Future<void> main() async {
  try{
    final file = File('assets/lorem_long.txt');
    final stream = file.openRead();
    await for (var data in stream) {
       print(data.length);
    }
  } on Exception catch(error){
    print(error);
  } finally {
    print("All done!");     
  }
}
  