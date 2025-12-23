
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Uygulama açılırken Counter modelini sağlayan yapı
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MyApp(),
    ),
  );
}

class Counter extends ChangeNotifier {
  int value = 0;
  void inc() {
    value++;
    notifyListeners();   // Dinleyen widget'lara haber verir
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
       // Counter sınıfındaki güncel değeri dinler
    final counter = context.watch<Counter>();

    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text("${counter.value}", style: TextStyle(fontSize: 40))),
          // Butona basıldığında sayacı artırır
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<Counter>().inc(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
