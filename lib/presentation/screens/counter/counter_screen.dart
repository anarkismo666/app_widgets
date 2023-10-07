import 'package:app_widgets/presentation/providers/counter_provider.dart';
import 'package:app_widgets/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Convertimos a ConsumerWidget de riverpod
class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';

  const CounterScreen({Key? key}) : super(key: key);

  @override  // Agregamos WidgetRef de reverpod
  Widget build(BuildContext context, WidgetRef ref) {

    // Cargamos ref de counterProvider
    final int clickCounter = ref.watch(counterProvider);
    // Cargamos ref de isDarkmodeProvider
    final bool clickTheme = ref.watch(isDarkmodeProvider);

    return Scaffold(
        appBar: AppBar(
            title: const Text("Counter Reverpod"),
            actions: [
                IconButton(
                    onPressed: () {
                        ref.read(isDarkmodeProvider.notifier).update((state) => !state);
                    }, 
                    //icon: const Icon(Icons.light_mode_outlined)
                    icon: clickTheme? const Icon(Icons.dark_mode_outlined):const Icon(Icons.light_mode_outlined)
                )
            ],
        ),
        body: Center(
            child: Text("Valor: $clickCounter", style: Theme.of(context).textTheme.titleLarge,),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
                // Cambiamos estado de ref de reverpod
                // Una forma de actualizar estado
                //ref.read(counterProvider.notifier).state ++;
                // OTRA:
                ref.read(counterProvider.notifier).update((state) => state+1);
            },
            child: const Icon(Icons.add),
        ),
    );
  }
}