Curso de
## Dart: trabalhando com a sintaxe e configuração de projeto

Dart:
- 2012
- Google
- Linguagem Orientada a Objetos
- Alternativa ao JavaScript
- Ótima documentação
- Simples curva de aprendizado
- Boa performance
- Ascensão no mercado
- 2021 se tornou o Framework Mobile Multiplataforma mais usado no mundo
- Grandes empresas usam:
	- Google
	- iFood
	- eBay
	- Alibaba
	

Flutter:
- Framework (ferramenta)
- 2017
- Aplicativos multiplataformas

Flame:
- Criação de jogos 2D

Jaguar:
- Criação de servidores


Terminal é CASE SENSITIVE

```sh
dart create meu_app
```
gerar projeto novo com o nome 'meu_app'

```sh
cd meu_app
dart run
```
executar projeto

Visual Studio Code (VSC)

> F1
> Dart: New Project
> Console Application 

```dart
void main() {
  print('Olá, Mundo!');
}
```

Ctrl + j = Fechar terminal 
Ctrl + b = Fechar aba lateral esquerda

```dart
import 'dart:io';

void main() {
  print('Olá, Mundo!');

  // captura de dados do usuário
  var entrada = stdin.readLineSync();
  print(entrada);
}
```

```dart
import 'dart:io';

void main() {
  print('Olá, me chamo Dart. Qual seu nome?');
  var entrada = stdin.readLineSync();
  print("Muito prazer, $entrada");
}
```

https://patorjk.com/software/taag/#p=display&c=echo&f=Small&t=Notas

