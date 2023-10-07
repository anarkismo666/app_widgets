import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = "animated_screen";
  
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 160;
  double height = 150;
  Color color = Colors.indigo;
  double bordeRadius = 20.0;

  void changeShape(){
      final random = Random();
      
      setState(() {
        width = random.nextInt(300) + 50;
        height = random.nextInt(300) + 50;
        color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
        bordeRadius = random.nextInt(100) + 10;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Animated container"),
        ),
        body: Center(
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.elasticInOut,
                width: width<=0? 0: width,
                height: height<=0? 0: height,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(bordeRadius<=0? 0: bordeRadius)
                ),
            ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: changeShape,
            child: const Icon(Icons.play_arrow),
        ),
    );
  }
}