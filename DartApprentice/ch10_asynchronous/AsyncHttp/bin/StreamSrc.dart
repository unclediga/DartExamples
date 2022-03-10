import 'dart:io';

void main() {
  final file = File('assets/lorem_long.txt');
  final stream = file.openRead();
  stream.listen( (data) 
     {print(data.length);}
  );
}
  