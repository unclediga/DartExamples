import 'dart:io';

Future<void> main() async {
  final file = File('assets/lorem.txt');
  final content = await file.readAsString();
  print(content);
}
  