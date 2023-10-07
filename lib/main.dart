
import 'package:app_widgets/config/router/app_router.dart';
import 'package:app_widgets/config/theme/app_theme.dart';
/*
import 'package:app_widgets/presentation/screens/buttons/buttons_screen.dart';
import 'package:app_widgets/presentation/screens/cards/cards_screen.dart';
import 'package:app_widgets/presentation/screens/home/home_screen.dart';
*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(
    const ProviderScope(
      child:  MyApp()
    )
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme(selectorColor: 3).getTheme(),
      // Esto el lo mismo que el home y routes

      /*
      home: const HomeScreen(),
      routes: {
          '/buttons':(context) => const ButtonsScreen(),
          '/cards':(context) => const CardsScreen(),
      },
      */
    );
  }
}