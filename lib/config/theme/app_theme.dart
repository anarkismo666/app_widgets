import 'package:flutter/material.dart';

const colorList = <Color>[
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.yellowAccent
];

class AppTheme{
    final int selectorColor;
    

  AppTheme({
      this.selectorColor = 0}
  ):assert(selectorColor>=0, 'Color debe ser mayor a cero'),
   assert(selectorColor < colorList.length, 'Color debe ser menor a ${colorList.length-1}');

  //Retornar themedata
  ThemeData getTheme()=>ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectorColor],
    appBarTheme: const AppBarTheme(
        centerTitle: true
    )
  );
}