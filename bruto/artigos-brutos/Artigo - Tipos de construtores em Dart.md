# Tipos de construtores em Dart: guia prático para iniciantes

[Link Artigo Alura](https://www.alura.com.br/artigos/construtores-dart-tipos-como-usa-los)

## O que são construtores?

* Dart é uma linguagem que segue o paradigma de Orientação a Objetos.
  * Utiliza o conceito de **classe**.
    * É a representação de **objetos** com características e comportamentos em comum.
    * É um *"molde"* ou uma *"forma"*

Exemplo: Representar diversos funcionários de um escritório de vendas de papéis e materiais de escritório. *Dunder Mifflin* possui vários funcionários (recepcionista, vendedores, gerente, entre outros).

Criar a classe de um objeto chamado `Funcionario`:
```dart
class Funcionario {
    final String nome;
    final int idade;
    final String funcao;
    final String hobby;
}
```
Agora, podemos criar uma instância *(um objeto)* dessa classe. Os **construtores** "constroem" objetos (instâncias) a partir de uma classe.

## Construtor padrão e *Syntax sugar*

Caso você não implemente seu construtor em uma classe, o Dart gera um **construtor padrão**. Esse construtor não possui argumentos e normalmente não é isso que queremos.

```dart
class Funcionario {

    // parâmetros
    String? nome;
    int? idade;
    String? funcao;
    String? hobby;

    // construtor
    Funcionario(String nome, int idade, String funcao, String hobby) {
        this.nome = nome;
        this.idade = idade;
        this.funcao = funcao;
        this.hobby = hobby;
    }
}
```
Syntax Sugar é uma forma de "adocicar" o código, ou seja, simplificar e facilitar a escrita e a leitura do código.

Construtor com *Syntax Sugar*:

```dart
class Funcionario {
    String nome;
    int idade;
    String funcao;
    String hobby;
    Funcionario(this.nome, this.idade, this.funcao, this.hobby);
}
```
> Observe que nesse caso, não usamos o sinal `?` na declaração dos nossos atributos, pois o objeto `Funcionario`, ao ser inicializado, terá necessariamente valores não nulos.

Tanto para o construtor comum quanto o contrutor *Syntax Sugar*, podemos criar a instância do objeto `Funcionario` da seguinte maneira:
```dart
Funcionario funcionario = Funcionario("Pam", 26, "Recepcionista", "Artes");
```
Criamos nosso objeto `Funcionario` utilizando um construtor e passando (através dos **parâmetros**), o `nome`, a `idade`, `cargo` eo `hobby`.

## Parâmetros em construtores

4 principais parâmetros que podemos utilizar:

* Opcionais posicionais;
* Opcionais nomeados;
* Obrigatórios posicionais;
* Obrigatórios nomeados;

As informações **obrigatórias** (nome, idade e cargo), podemos relacioná-las com os **parâmetros obrigatórios**: são aqueles que **obrigatoriamente precisamos passar** através do construtor no momento da chamada, ou seja, **não podemos deixá-los vazios**.

As informações **opcionais** (hobby), estão ligadas aos **parâmetros opcionais** - *oposto do obrigatório* - podem ou não ser passados através do construtor.

Parâmetros **posicionais** são aqueles que precisam estar numa posição específica durante a criação do objeto com o construtor.

Parâmetros **nomeados** não precisam de uma posição ou ordem específica, pois eles recebem e são identificados por **nomes específicos**.

## Parâmetros Opcionais Posicionais

* Parâmetros opcionais não precisam necessariamente passa-los através do construtor.
* Parâmetros posicionais precisam estar em uma ordem específica para serem reconhecidos.

```dart
Funcionario(this.nome, this.idade, this.funcao, [this.hobby]);

// Podemos ou não passar o parâmetro `hobby`, e o atributo precisa ser *nullable* (pode ou não ser nulo).
```
```dart
class Funcionario {
    String nome;
    int idade;
    String funcao;
    String? hobby;

    Funcionario(this.nome, this.idade, this.funcao, [this.hobby]);
}

// Para deixá-lo nulo, escrevemos um sinal de `?` na definição do seu tipo.
```

Atribuir um valor a variável dentro do próprio construtor, assim, caso não seja passados nenhum valor, a variável ainda assim não será nula.

```dart
Funcionario(this.nome, this.idade, this.funcao, [this.hobby = "Sem Hobby"]);

// Por padrão, quando não passar o valor de `hobby`, ela seja `Sem Hobby`.
```

Em ambos dos casos, tanto com a variável *nullable* quanto utilizando um valor padrão no construtor, podemos criar objetos que podem ou não ter o atributo `hobby`.

```dart
Funcionario funcionario = Funcionario("Pam Beesly", 26, "Recepcionista", "Artes");
Funcionario funcionario2 = Funcionario("Pam Beesly", 26, "Recepcionista");
```

    Se trocar os valores das variáveis do mesmo tipo no construtor, não haverá erros, mas se forem de tipos diferentes, haverá problema.


## Parâmetros Opcionais Nomeados

Podem ou não ser passados, porém eles possuem nomes, ou seja, são **identificados através de nomeações e não posições**.

```dart
Funcionario(this.nome, this.idade, this.funcao, {this.hobby});

// tornar o atributo `hobby` opcional e nomeado.
```

Usamos chaves `{}` para criar parâmetros opcionais e nomeados.

```dart
class Funcionario {
    String nome;
    int idade;
    String funcao;
    String? hobby;

    Funcionario(this.nome, this.idade, this.funcao, {this.hobby});
}
``` 
```dart
class Funcionario {
    String nome;
    int idade;
    String funcao;
    String hobby;

    Funcionario(this.nome, this.idade, this.funcao, {this.hobby = "Sem Hobby"});
} 
``` 
```dart
Funcionario funcionario = Funcionario("Pam Beesly", 26, "Recepcionista", hobby: "Artes");
Funcionario funcionario2 = Funcionario("Pam Beesly", 26, "Recepcionista"); 
``` 

## Parâmetros Obrigatórios Posicionais

* **Parâmetros obrigatórios** são aqueles que necessariamente precisam ser passados através do construtor.
* **Parâmetros posicionais** são aqueles que precisam estar numa posição específica quando passados.

```dart
class Funcionario {
    String nome;
    int idade;
    String funcao;
    String hobby;

    Funcionario(this.nome, this.idade, this.funcao, this.hobby);
}
```
```dart
Funcionario funcionario = Funcionario("Pam Beesly", 26, "Recepcionista", "Artes");

// Os valores precisam estar completos (sem parâmetros a mais ou a menos) e na posição correta.
```

## Parâmetros Obrigatórios Nomeados

* Para que não precisem estar em uma ordem específica e até mesmo para deixar mais legível a construção do seu objeto.

Para torná-lo nomeado, pode utilizar chaves `{}`.

Se usar apenas as chaves, eles se tornam nomeados opcionais, logo, utilizamos um modificador chamado `required` na frente do argumento que deve ser obrigatório.

```dart
class Funcionario {
    String nome;
    int idade;
    String funcao;
    String hobby;
    
    Funcionario({required this.nome, required this.idade, required this.funcao,  required this.hobby});
}
```
```dart
Funcionario funcionario = Funcionario(nome: "Pam Beesly", idade: 26, funcao: "Recepcionista", hobby: "Artes");
```

## Resumindo os 4 principais parâmetros em Dart

```dart
// Obrigatório nomeado

class Bolo {
    String massa;
    String recheio;

    Bolo({required this.massa, required this.recheio});
}
```
```dart
// Obrigatório posicional

class Bolo {
    String massa;
    String recheio;

    Bolo(this.massa, this.recheio);
}
```
```dart
// Opcional nomeado

class Bolo {
    String massa;
    String? recheio;

    Bolo(this.massa, {this.recheio});
}
```
```dart
// Opcional posicional

class Bolo {
    String massa;
    String? recheio;

    Bolo(this.massa, [this.recheio]);
}
```

## Construtor nomeado

O Dart permite criar vários construtores dentro de uma mesma classe.

**Construtores nomeados**: construtores com nomes.

2 vantagens:
* **Sobrecarga de construtores**: Mais de um construtor dentro de uma classe. Para diferenciá-los, colocamos um nome diferente para cada um.
* **Legibilidade do código**: Código mais legível e retornam uma instância exata de um objeto, assim como um construtor comum.


**Caso**

Caso do funcionário querer informar o hobby e casos em que ele não quer.
Pode-se resolver isso utilizando um parâmetro opcional.
Outra solução seria mais um construtor:
1. O primeiro (não nomeado): Retorna uma instância com o atributo `hobby`.
2. O segundo (nomeado como `semHobby`): Retorna uma instância sem o atributo `hobby`.


```dart
class Funcionario {

    String nome;
    int idade;
    String funcao;
    String? hobby;

    Funcionario(this.nome, this.idade, this.funcao, this.hobby);
    Funcionario.semHobby(this.nome, this.idade, this.funcao);

}
```
```dart
Funcionario funcionario1 = Funcionario("Pam", 26, "Recepcionista", "Artes");
Funcionario funcionario2 = Funcionario.semHobby("Dwight Schrute", 35, "Assistente Gerente Regional");
```

## Construtor constante

Existem situações que pode ser melhor criar objeto que **não possam ser alterados** em prol do desempenho da aplicação, visto que objeto que têm seus valores definidos e inalterados consomem menos memória que outros.

* Para criar uma instância da sua classe que **não mude**, podemos utilizar um **construtor constante**.
* Este construtor usa um *modificador de imutabilidade* chamado `const`, que determina que o objeto não pode inicializar sem um valor e também que, após receber um valor, ele não pode ser alterado.
* Os atributos da classe precisam também de outro modificador de imutabilidade chamado `final`, que não precisa ter um valor inicial na sua declaração, mas que também não pode ser alterado ao receber um valor.

```dart
class Funcionario {
  
  final String nome;
  final int idade;
  final String funcao;
  final String hobby;
  
  const Funcionario(this.nome, this.idade, this.funcao, this.hobby);

}
```

Quando criamos uma instância dessa classe com esse tipo de construtor, usamos novamente o modificador `const` e não podemos alterar posteriormente qualquer atributo.

```dart
Funcionario funcionario = const Funcionario("Michael Scott", 40, "Gerente Regional", "Improviso");

funcionario.idade = 28; // erro de compilação
```

## Construtor de fábrica

**Método de Fábrica**: 
* Um Design Pattern que nos auxilia na criação de objetos, aumentando a flexibilidade e reutilização de código.
* Consiste em criar objetos sem expor a lógica de criação ao cliente.

É possível criar um código que tenha uma classe mãe chamada `Funcionario` e duas classes filhas chamadas `Gerente` e `Vendedor`, que devem ter as mesmas características da sua classe mãe. O conceito usado para explicar esse cenário chama **herança**, pois as classes filhas **herdam os atributos e métodos** da classe mãe.

```dart
// Classe mãe
class Funcionario {
    String nome;
    int idade;
    String hobby;

    Funcionario(this.nome, this.idade, this.hobby);
}

// Classe filha
class Gerente extends Funcionario {
    Gerente(super.nome, super.idade, super.hobby);
}

// Classe filha
class Vendedor extends Funcionario {
    Vendedor(super.nome, super.idade, super.hobby);
}
```

Construtor de fábrica, usando a palavra chave `factory` na frente do construtor nomeado e retornando para cada caso uma instância diferente.

```dart
// Classe mãe
class Funcionario {
    String nome;
    int idade;
    String hobby;
    Funcionario(this.nome, this.idade, this.hobby);
    
    // Construtor de fábrica
    factory Funcionario.criar(String nome, int idade, String hobby,
        {String funcao = ""}) {
        switch (funcao) {
        case "Gerente":
            return Gerente(nome, idade, hobby);
        case "Vendedor(a)":
            return Vendedor(nome, idade, hobby);
        default:
            return Funcionario(nome, idade, hobby);
        }
    }
}
```

No código acima, temos um parâmetro opcional nomeado chamado `cargo` que recebemos a fim de usar uma estrutura de seleção condicional (`switch case`), na qual analisamos esse parâmetro e, para cada caso, retornamos algo diferente:

* Se recebermos "Gerente", retornamos uma instância do tipo `Gerente`;
* Se recebermos "Vendedor(a)", retornamos uma instância do tipo `Vendedor`; 
* E caso a gente não receba nada (ou chegue algo que não se encaixe nas opções anteriores), apenas retornamos uma instância de `Funcionario`.

```dart
// Instância de Gerente:
Funcionario gerente = Funcionario.criar("Michael Scott", 47, "Improviso", funcao: "Gerente");

// Instância de Vendedor:
Funcionario vendedor = Funcionario.criar("Jim Halpert", 26, "Pegadinhas", funcao: "Vendedor(a)");
```

## Construtor de redirecionamento

Um construtor de redirecionamento pode ser usado em 4 casos para:
1. Redirecionar a uma outro construtor.
2. Produzir um construtor comum.
3. Fazer um construtor com verificações.
4. Invocar uma classe mãe.

### Entendendo a lista de inicializadores

O construtor redirecionador usa um conceito chamado *Lista de Inicializadores*. 
Exemplo usado no cotidiano do programador Dart: aplicação que lida com conexão à internet.

É comum que informações da internet venham em um formato conhecido chamado `JSON` que pode ser transformado em um formato de variável chamado `map`.

Nesse caso, o redirecionamento pode ser utilizado para receber um valor do tipo `JSON` na nossa classe e inicializar os atributos do objeto. 

Veja, abaixo, um exemplo em que temos um construtor nomeado chamado `fromJson` que recebe um dado `map` e constrói o objeto a partir dele:

```dart
class Funcionario {
    String nome;
    int idade;
    String funcao;
    String hobby;

    Funcionario(this.nome, this.idade, this.funcao, this.hobby);
    
    Funcionario.fromJson(Map<String, dynamic> map)
        : nome = map['nome'],
            idade = map['idade'],
            funcao = map['funcao'],
            hobby = map['hobby'];
}
```