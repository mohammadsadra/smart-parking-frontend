import 'package:flutter/material.dart';

class CustomMaterialColor {
  final int r;
  final int g;
  final int b;

  CustomMaterialColor(this.r, this.g, this.b);

  MaterialColor get mdColor {
    Map<int, Color> color = {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    };
    return MaterialColor(Color.fromRGBO(r, g, b, 1).value, color);
  }
}
