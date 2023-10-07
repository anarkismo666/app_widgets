import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = "progress_screen";
  
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Progress indicator"),
        ),
        body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
            children: [
                SizedBox(height: 30,),
                Text("Circular progress indicator"),
                SizedBox(height: 10,),
                CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black26,),
                SizedBox(height: 10,),
                Text("Circular y linear progress indicator controlado"),
                SizedBox(height: 20,),
                _ControllerProgressBarIndicator()
            ],
        ),
    );
  }
}

class _ControllerProgressBarIndicator extends StatelessWidget {
  const _ControllerProgressBarIndicator() ;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: Stream.periodic(
          const Duration(microseconds: 300),
          (computationCount) {
              return (computationCount*2)/100;
          },
      ).takeWhile((value) => value<100),
      builder: (context, snapshot) {

        final double progressValue = double.tryParse(snapshot.data.toString())  ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  CircularProgressIndicator(
                      value: progressValue,
                      strokeWidth: 2,
                      backgroundColor: Colors.black12,
                  ),
                  const SizedBox(width: 20,),
                  //  Metemos el LinearProgressIndicator en un expander para indicar el tamañp y no marque error
                  Expanded(
                      child: LinearProgressIndicator(value: progressValue,),
                  )
              ],
          ),
        );
      }
    );
  }
}