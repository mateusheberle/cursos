# flutter_screenutil

[pub.dev](https://pub.dev/packages/flutter_screenutil)

flutter_screenutil é um plugin que facilita a adaptação de telas, widgets e fontes para diferentes tamanhos de tela. Ele te ajuda a criar interfaces que se moldam automaticamente ao tamanho do dispositivo, mantendo proporções e legibilidade.

Compatível com Android, iOS, Web e até desktops (Windows, macOS, Linux)

## Como usar:

| Tipo | Exemplo | O que faz                                              |
| ---- | ------- | ------------------------------------------------------ |
| `h`  | `20.h`  | Escala com a **altura** da tela                        |
| `w`  | `10.w`  | Escala com a **largura** da tela                       |
| `sp` | `16.sp` | Escala com base no tamanho da fonte (ideal para texto) |
| `r`  | `12.r`  | Escala proporcional geral (altura + largura)           |


### Instalação do pacote:

```yaml
dependencies:
  flutter_screenutil: ^5.9.3
```

### Importação

```dart
import 'package:flutter_screenutil/flutter_screenutil.dart';
```

### Inicialização no `main.dart`

```dart
void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690), // 📐 Tamanho do seu layout no Figma
      minTextAdapt: true,         // 🔡 Faz com que textos pequenos não "estourem"
      splitScreenMode: true,      // 🪟 Suporte a telas divididas
      builder: (_, __) => MaterialApp(
        home: MyHomePage(),
      ),
    ),
  );
}
```
```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Base do design (ex: iPhone X)
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
```
```dart
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // ajuste conforme o design-base
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        title: 'Pokédex',
        theme: theme,
        initialRoute: '/',
        routes: { /* ... */ },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
```

### Usando o ScreenUtil com base no Figma

```dart
Container(
  width: 300.w, // 🔁 Equivalente aos 300px de largura no Figma
  height: 60.h, // 🔁 Altura escalada automaticamente
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12.r), // 🔁 Bordas ajustadas
  ),
  child: Center(
    child: Text(
      'Clique Aqui',
      style: TextStyle(fontSize: 18.sp), // 🔠 Fonte proporcional
    ),
  ),
);
```
```dart
Text(
  'Olá!',
  style: TextStyle(fontSize: 20.sp),
);

SizedBox(height: 16.h);

Container(
  width: 100.w,
  height: 50.h,
);
```

### Orientação e Tela Dividida

```dart
ScreenUtilInit(
  designSize: Size(360, 690),
  minTextAdapt: true,
  splitScreenMode: true,
  useInheritedMediaQuery: true, // 🔁 Usa contexto real da tela
)
```

### Exemplo de Adaptação para Tablets

```dart
ScreenUtilInit(
  designSize: WidgetsBinding.instance.window.physicalSize.width > 600
      ? Size(768, 1024) // 📲 Base de tablet (ex: iPad)
      : Size(360, 690), // 📱 Base padrão para smartphones
  builder: (_, __) => MaterialApp(
    home: MyHomePage(),
  ),
);
```

### Layout dinamicamente

```dart
Widget build(BuildContext context) {
  bool isTablet = 1.sw > 600; // 📏 Detecta se é tablet

  return Padding(
    padding: EdgeInsets.all(isTablet ? 32.w : 16.w),
    child: Text(
      'Texto adaptado',
      style: TextStyle(fontSize: isTablet ? 24.sp : 16.sp), // 📐 Fonte maior em telas maiores
    ),
  );
}
```