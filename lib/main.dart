import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodflutterapp/FoodState.dart';
import 'package:foodflutterapp/ui/home/HomeScreen.dart';
import 'package:foodflutterapp/ui/home/bloc/HomeFoodBloc.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Scaffold(
        body: BlocProvider(
            create: (BuildContext context)  => HomeFoodBloc(InitFoodState()),
            child : HomeScreen()
        ),
      ),
     //   '/home': (context) => HomeScreen(),
     // '/details': (context) => RecipeDetailsScreen()
    },
  ));
}
