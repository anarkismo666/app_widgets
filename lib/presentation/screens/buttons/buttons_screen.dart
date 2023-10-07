import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Buttons Screen"),
        ),
        body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
              context.pop();
          },
        ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
              children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Elevated")
                  ),
                  const ElevatedButton(
                      onPressed: null,
                      child: Text("Elevated diabled"),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {}, 
                      icon: const Icon(Icons.access_alarm), 
                      label: const Text("Elevated Icon")
                  ),
                  FilledButton(
                    onPressed: () {}, 
                    child: const Text("Filled")
                  ),
                  FilledButton.icon(
                    onPressed: () {
                      
                    },
                    icon: const Icon(Icons.accessibility_new), 
                    label: const Text("Filled icon")
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("Outline")
                  ),
                  OutlinedButton.icon(
                    onPressed: () {}, 
                    icon: const Icon(Icons.adb_rounded), 
                    label: const Text("Outline icon")),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text("Textbutton")
                  ),
                  TextButton.icon(
                    onPressed: () {}, 
                    icon: const Icon(Icons.accessibility_new_outlined), 
                    label: const Text("Text icon")
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.account_box)
                  ),
                  IconButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(colors.primary),
                    ),
                    onPressed: () {}, 
                    icon: const Icon(Icons.account_box, color: Colors.white,)
                  ),
                  const CustomButton()
              ],
          ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return  ClipRRect(  // Para redonder bordes
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        // Inkwell -> parecido a Gesturedetector
        child: InkWell(
          onTap: () {
            
          },
          child:  const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("CUSTOM BUTTON", style: TextStyle(color: Colors.black),)
          ),
        ),
      ),
    );
  }
}