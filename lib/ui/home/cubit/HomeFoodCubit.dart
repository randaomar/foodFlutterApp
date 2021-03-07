import 'package:foodflutterapp/FoodCubit.dart';
import 'package:foodflutterapp/FoodState.dart';
import 'package:foodflutterapp/service/FoodService.dart';
import '../../../FoodState.dart';

class HomeFoodCubit extends FoodCubit {
  HomeFoodCubit(FoodState initialState) : super(initialState);

  @override
  String getTitle()  => "Home Screen";

  FoodState get initialState => InitFoodState();

  void getRecipes()  {
    emit(LoadingState());
     getAllRecipes().then((value) => emit(RecipeListState(value)));
  }

  @override
  void refreshData() {
    getRecipes();
  }

}