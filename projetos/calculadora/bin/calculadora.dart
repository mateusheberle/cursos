import 'dart:io';

void main() {
  /* Declarações de variáveis */
  double numeroUm = 0;
  double numeroDois = 0;
  String operacao = "";
  String? entrada = "";
  List<String> operacoes = <String>["+", "-", "*", "/"];

  /* Declarações de funções */
  void soma() {
    print(numeroUm + numeroDois);
  }

  void subtracao() {
    print(numeroUm - numeroDois);
  }

  void divisao() {
    print(numeroUm / numeroDois);
  }

  void multiplicacao() {
    print(numeroUm * numeroDois);
  }

  void calcular() {
    switch (operacao) {
      case "+":
        soma();

      case "-":
        subtracao();

      case "*":
        multiplicacao();

      case "/":
        divisao();

        break;
    }
  }

  void getOperacao() {
    print("Digite uma operação ${operacoes.toString()}");
    entrada = stdin.readLineSync();
    if (entrada != null) {
      if (operacoes.contains(entrada)) {
        operacao = entrada!;
      } else {
        print("Operação inválida");
        getOperacao();
      }
    }
  }

  /* Começa efetivamente a "Calculadora" */
  print("Digite o primeiro valor");

  entrada = stdin.readLineSync();

  if (entrada != null) {
    if (entrada != "") {
      numeroUm = double.parse(entrada!);
    }
  }

  getOperacao();

  print("Digite o segundo valor");

  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != "") {
      numeroDois = double.parse(entrada!);
    }
  }

  print("O resultado da operação é:");

  calcular();
}
