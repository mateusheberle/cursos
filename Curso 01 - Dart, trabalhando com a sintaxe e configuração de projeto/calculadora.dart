import 'dart:io';

void main() {
  double numeroUm = 0;
  double numeroDois = 0;
  String operacao = "";
  List<String> operacoes = <String>['+', '-', '*', '/'];
  String? entrada = "";

  void soma() {
    print(numeroUm + numeroDois);
  }

  void subtracao() {
    print(numeroUm - numeroDois);
  }

  void multiplicacao() {
    print(numeroUm * numeroDois);
  }

  void divisao() {
    print(numeroUm / numeroDois);
  }

  void calcular() {
    switch (operacao) {
      case '+':
        soma();
        break;
      case '-':
        subtracao();
        break;
      case '*':
        multiplicacao();
        break;
      case '/':
        divisao();
        break;
      default:
        print('Operação inválida');
    }
  }

  void getOperacao() {
    print('Digite uma operação ${operacoes.toString()}: ');

    entrada = stdin.readLineSync();
    if (entrada != null) {
      if (operacoes.contains(entrada)) {
        operacao = entrada!;
      } else {
        print('Operação inválida');
        getOperacao();
      }
    }
  }

  // if (operacao == '+') {
  //   soma();
  // } else if (operacao == '-') {
  //   subtracao();
  // } else if (operacao == '*') {
  //   multiplicacao();
  // } else if (operacao == '/') {
  //   divisao();
  // } else {
  //   print('Operação inválida');
  // }

  print('Digite o primeiro valor: ');

  entrada = stdin.readLineSync()!;
  if (entrada != null) {
    if (entrada != "") {
      numeroUm = double.parse(entrada!);
    }
  }

  getOperacao();

  print('Digite o segundo valor: ');

  entrada = stdin.readLineSync()!;
  if (entrada != null) {
    if (entrada != "") {
      numeroDois = double.parse(entrada!);
    }
  }

  print("O resultado da operação é: ");

  calcular();
}
