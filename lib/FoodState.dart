import 'Models.dart';

abstract class FoodState {
}

class InitFoodState extends FoodState{}
class LoadingState extends FoodState{}
class ExpiredSessionState extends FoodState{}
class RecipeListState extends FoodState{
  final List<Recipe> recipeList;
  RecipeListState(this.recipeList);

}