import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodflutterapp/Models.dart';
import 'package:flutter_html/flutter_html.dart';



class RecipeDetailsScreen extends StatefulWidget {
  Recipe recipe;
  RecipeDetailsScreen({this.recipe});
  @override
  _RecipeDetailsScreen createState() => _RecipeDetailsScreen(recipe: recipe);
}

class _RecipeDetailsScreen extends State<RecipeDetailsScreen> {

  Recipe recipe;
  _RecipeDetailsScreen({this.recipe});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0, leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),),
      body:Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Stack(
                    children: <Widget>[
                      Positioned.fill(child:  Image.network(recipe.image, fit: BoxFit.cover,)),
                      Positioned.fill(child:  Container(color: Colors.black.withOpacity(0.4),)),
                      Positioned(child: Text(recipe.title, style: TextStyle(color: Colors.white, fontSize: 24)), bottom: 30, left: 20, right: 20,)
                    ],
                    ),
                  )
                  ,),
                Container( padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Ready in: ${recipe.readyInMinutes} mins", style: TextStyle(fontSize: 18, color: Colors.grey[700])),
                    SizedBox(height: 8,),
                    Text("Number of servings: ${recipe.servings}", style: TextStyle(fontSize: 18, color: Colors.grey[700])),
                    SizedBox(height: 10,),
                    Container(height: 0.5, width: double.infinity, color: Colors.grey[400],),
                    SizedBox(height: 5,),
                    Text("Summary:", style: TextStyle(fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.bold)),
                    Html(data: recipe.summary,),
                    SizedBox(height: 5,),
                    Container(height: 0.5, width: double.infinity, color: Colors.grey[400],),
                    SizedBox(height: 5,),
                    Text("Ingredients:", style: TextStyle(fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.bold)),
                    SizedBox(height: 8,),
                   Column(children: getIngredients(), crossAxisAlignment: CrossAxisAlignment.stretch,)
                  ],
                ),)
              ],
            ),
          ),
      ),
    );
  }

 List<Text> getIngredients() {
    return recipe.extendedIngredients.map((e) => Text(e.original, style: TextStyle(fontSize: 15, color: Colors.grey[700]))).toList();
 }

  @override
  void initState() {
    super.initState();
  }




}
