class Recipe{
  int id;
  String title;
  String image;
  int servings;
  int readyInMinutes;
  String summary;
  List<Ingredients> extendedIngredients;
  //List<Map<String, String>> extendedIngredients;

  Recipe({this.id, this.image, this.servings, this.readyInMinutes, this.summary, this.title, this.extendedIngredients});

  factory Recipe.fromJson(Map<String, dynamic> json){
    List<Ingredients> ingredients =   List<Ingredients>.from(json["extendedIngredients"].map((x) => Ingredients.fromJson(x)));

    return Recipe(  id :json['id'],
        title : json['title'],
        image : json['image'],
        servings :json['servings'],
        readyInMinutes: json['readyInMinutes'],
        extendedIngredients: ingredients,
        summary : json['summary']);

  }

}

class Ingredients{
  String original;
  Ingredients({this.original});
  factory Ingredients.fromJson(Map<String, dynamic>json) {
    String ingredient = json['original'];
    return Ingredients(original: ingredient);
  }
}

class RecipesResponse {
  List<Recipe> recipes;

  RecipesResponse(this.recipes);

  factory RecipesResponse.fromJson(Map<String, dynamic>json) {
    // var list = json['recipes'] as List;
    List<Recipe> recipeList =  new List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x)));

    return RecipesResponse(recipeList);
  }
}