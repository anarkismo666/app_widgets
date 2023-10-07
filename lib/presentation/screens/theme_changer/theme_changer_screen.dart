import 'package:app_widgets/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = "theme_changer_screen";
  
  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context , WidgetRef ref) {

    final bool isDarkmode = ref.watch(isDarkmodeProvider);

    return Scaffold(
        appBar: AppBar(
            title: Text("Theme changer"),
            actions: [
              IconButton(
                    onPressed: () {
                        //ref.read(isDarkmodeProvider.notifier).update((state) => !state);
                    }, 
                    //icon: const Icon(Icons.light_mode_outlined)
                    icon: isDarkmode? const Icon(Icons.dark_mode_outlined):const Icon(Icons.light_mode_outlined)
                )
            ],
        ),
        body: const _ThemeChangedView(),
    );
  }
}

class _ThemeChangedView extends ConsumerWidget {
  const _ThemeChangedView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
            final Color color = colors[index];
            return RadioListTile(
                value: index, 
                groupValue: 0, 
                title: Text("Este color", style: TextStyle(color: color),),
                subtitle: Text('${color.value}'),
                activeColor: color,
                onChanged: (value) {
                  
                },);
        },);
  }
}