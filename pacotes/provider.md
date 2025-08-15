# provider

```yaml
dependencies:
  provider: ^6.1.5
```

```sh
flutter pub add provider
```

1. Crie o provider (`usuario_provider.dart`)
```dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/usuario.dart';

class UsuarioProvider with ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> carregarUsuario(String uid) async {
    if (_usuario != null) return; // já carregado

    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      _usuario = Usuario.fromMap(doc.data()!);
      notifyListeners(); // atualiza UI se necessário
    }
  }

  void limpar() {
    _usuario = null;
    notifyListeners();
  }
}
```

2. Adicione o provider no main.dart
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usuario_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
      ],
      child: MyApp(),
    ),
  );
}
```

3. Carregue os dados ao iniciar o app
```dart
@override
void initState() {
  super.initState();

  final uid = FirebaseAuth.instance.currentUser!.uid;

  // só carrega uma vez
  Provider.of<UsuarioProvider>(context, listen: false).carregarUsuario(uid);
}
```

4. Use os dados do usuário em qualquer tela
```dart
@override
Widget build(BuildContext context) {
  final usuario = Provider.of<UsuarioProvider>(context).usuario;

  if (usuario == null) {
    return const Center(child: CircularProgressIndicator());
  }

  return Text('Olá, ${usuario.nome}');
}
```