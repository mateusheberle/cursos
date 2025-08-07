import 'dart:io';

void main() {
  print('Olá, me chamo Dart. Qual seu nome?');
  var entrada = stdin.readLineSync();
  print("Muito prazer, $entrada");
}
