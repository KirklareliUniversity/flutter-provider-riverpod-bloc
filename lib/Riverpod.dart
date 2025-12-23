
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// PROVIDER
final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(
      // Riverpod’un çalışması için ProviderScope gerekir
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("$count", style: const TextStyle(fontSize: 40)),
        ),
         // Butona basınca değeri 1 artırır
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
