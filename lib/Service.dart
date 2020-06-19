import 'dart:convert';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';


import 'Models.dart';


Future<List<Recipe>> getAllRecipes() async {
  Response response = await get('https://api.spoonacular.com/recipes/random?apiKey=9c5df10fe6ad4569b533145864affdc8&number=10');
  if(response.statusCode == 200) {
    RecipesResponse recipesResponse = RecipesResponse.fromJson(json.decode(response.body));
    return Future((){return recipesResponse.recipes;});
  }
  return null;
}
