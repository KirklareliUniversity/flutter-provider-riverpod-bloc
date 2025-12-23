
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// CUBIT
// BLoC yapısı = Event → State dönüşümü yapan sınıf
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void inc() => emit(state + 1);
}

void main() {
  runApp(
      // CounterBloc'u uygulamaya sağlayan yapı
    BlocProvider(
      create: (_) => CounterCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (_, count) => Text("$count", style: const TextStyle(fontSize: 40)),
          ),
        ),
            // Butona basınca IncrementEvent gönderir
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().inc(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
