import 'package:flutter/material.dart';
import 'package:foodflutterapp/RecipeDetailsScreen.dart';

import 'HomeScreen.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
      '/details': (context) => RecipeDetailsScreen()
    },
  ));
}
