import 'package:foodflutterapp/FoodBloc.dart';
import 'package:foodflutterapp/FoodEvent.dart';
import 'package:foodflutterapp/FoodState.dart';
import 'package:foodflutterapp/service/FoodService.dart';
import '../../../FoodEvent.dart';
import '../../../FoodState.dart';
import '../../../Models.dart';

class HomeFoodBloc extends FoodBloc {
  HomeFoodBloc(FoodState initialState) : super(initialState);

  @override
  String getTitle()  => "Home Screen";

  FoodState get initialState => InitFoodState();

  @override
  Stream<FoodState> mapEventToState(FoodEvent event) async*{
    if(event is GetHomeListFoodEvent){
      yield LoadingState();
      List<Recipe> recipeList = await getRecipes();
      yield RecipeListState(recipeList);
    }
  }

  Future<List<Recipe>> getRecipes (){
    return getAllRecipes();
  }

  @override
  void refreshData() {
    add(GetHomeListFoodEvent());
  }

}