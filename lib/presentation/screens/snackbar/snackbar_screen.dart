import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";
  
  const SnackbarScreen({Key? key}) : super(key: key);

  void showCustomSnackbar(BuildContext context){
        ScaffoldMessenger.of(context).clearSnackBars();

        final snackBar = SnackBar(
            content: const Text("HOLA MUNDO"),
            action: SnackBarAction(label: "OK", onPressed: () {
              
            },),
            duration: const Duration(seconds: 2),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context){
      showDialog(
          context: context, 
          // PARA FORZAR CONTESTACIÓN
          barrierDismissible: false, 
          builder: (context) => AlertDialog(
               title: const Text("Mostrar licencias?"),
               content: const Text("Pulse el botón mostrar."),
               actions: [
                  TextButton(
                      onPressed: () {
                          context.pop();  //Para cerrar dialog
                      }, 
                      child: const Text("Cancelar")
                  ),
                  FilledButton(
                      onPressed: () {
                          context.pop();
                      }, 
                      child: const Text("Aceptar")
                  ),
               ],
          ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Snackbar/Dialogs"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    FilledButton.tonal(
                        onPressed: () {
                            showAboutDialog(
                              context: context,
                              children: [
                                  const Text("Licencias de la APP.")
                              ]
                            );
                        },
                        child: const Text("Licencias usadas")
                    ),
                    FilledButton.tonal(
                        onPressed: () {
                            openDialog(context);
                        },
                        child: const Text("Dialog")
                    ),
                ],
            ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            label: const Text("Mostrar snackbar"),
            icon: const Icon(Icons.access_alarm),
            onPressed: () {
                showCustomSnackbar(context);
            },
        ),
    );
  }
}