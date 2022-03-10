import 'dart:io';

Future<void> main() async {
  final file = File('assets/lorem_long.txt');
  final stream = file.openRead();
  await for (var data in stream) {
     print(data.length);
  }
}
  