import 'dart:io';
import 'dart:async';

Future<void> main() async {

  final file = File('assets/lorem_long.txt');
  final stream = file.openRead();
  StreamSubscription<List<int>>? subscription;
  subscription = stream.listen(
    (data){
      print(data.length);
      subscription?.cancel();
    },
    cancelOnError: true,
    onDone: () {
      print("All done!");
    }
  );
}   
    
  