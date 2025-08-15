# flutter_native_splash

[pub.dev](https://pub.dev/packages/flutter_native_splash)

O pacote `flutter_native_splash` é uma ferramenta popular no Flutter que automatiza a criação de telas de splash (tela de carregamento inicial) nativas tanto para Android quanto para iOS. Ele injeta imagens e cores diretamente nos arquivos nativos do projeto, garantindo que o splash screen seja exibido imediatamente ao abrir o app, antes mesmo do Flutter ser carregado.

## Como usar

1. Adicione o pacote no `pubspec.yaml`:

```yaml

dev_dependencies:
  flutter_native_splash: ^2.4.0

```

2. Configurar as opçoes no `pubspec.yaml`:

```yaml

flutter_native_splash:
  color: "#ffffff"
  image: assets/splash.png
  branding: assets/branding.png # opcional, exibe um logo abaixo
  color_dark: "#000000"
  image_dark: assets/splash_dark.png
  branding_dark: assets/branding_dark.png
  android: true
  ios: true
  web: false

  android_12:
    image: assets/splash_android12.png
    icon_background_color: "#ffffff"
    image_dark: assets/splash_android12_dark.png
    icon_background_color_dark: "#000000"

  fullscreen: true

```

3. Rode o comando para aplicar as configurações:

```sh

flutter pub run flutter_native_splash:create

```

*. Para remover o splash:

```sh

flutter pub run flutter_native_splash:remove

```