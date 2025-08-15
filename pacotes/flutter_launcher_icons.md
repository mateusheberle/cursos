# flutter_launcher_icons

[pub.dev](https://pub.dev/packages/flutter_launcher_icons)

O pacote `flutter_launcher_icons` serve para gerar automaticamente os ícones do app para Android e iOS a partir de uma imagem base. Ele elimina a necessidade de criar manualmente os diversos tamanhos exigidos por cada plataforma.

## Como usar

1. Adicione o pacote no `pubspec.yaml`:

```yaml

dev_dependencies:
  flutter_launcher_icons: ^0.13.1

```

2. Configurar as opçoes no `pubspec.yaml`:

```yaml

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/app_icon.png"
  min_sdk_android: 21 # (opcional) mínimo SDK do Android
  adaptive_icon_background: "#ffffff" # (ou "assets/icon/bg.png")
  adaptive_icon_foreground: "assets/icon/fg.png" # para Android 8.0+

```
```yaml
flutter_launcher_icons:
  image_path: assets/1024.png  # Caminho do seu ícone
  android: true
  ios: true
  android_gravity: center
  ios_content_mode: scaleAspectFit

  android_12:
    color: "#ffffff"
    image: assets/1024.png
    icon_background_color: "#ffffff"
```

1. Rode o comando para aplicar as configurações:

```sh
# deprecated
flutter pub run flutter_launcher_icons:main

# replaced
flutter pub run flutter_launcher_icons

```