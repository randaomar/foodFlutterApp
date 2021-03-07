
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodflutterapp/ui/FoodWidget.dart';

import '../../FoodState.dart';
import '../../Models.dart';
import '../../Utils.dart';
import 'cubit/HomeFoodCubit.dart';

class HomeScreen extends FoodWidget<HomeFoodCubit> {

  @override
  Widget buildFoodWidget(context) {
    final _bloc = BlocProvider.of<HomeFoodCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Text(_bloc.getTitle()),),
      body: SafeArea(
        child: BlocListener<HomeFoodCubit, FoodState>(
          listener: (context, state) {
            print("HERE WE GO!");
            if (state is LoadingState) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(child: CircularProgressIndicator(),);
                  });
            } else if(state is RecipeListState){
              Navigator.pop(context);
            }
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onTap: (){},
                  child: getSearchField(),
                ),
                SizedBox(height: 20,),
                Container(
                    height: 170,
                    child:BlocBuilder<HomeFoodCubit, FoodState>(
                      buildWhen: (FoodState previousState, FoodState currentState) => currentState is RecipeListState,
                      builder: (context, state) {
                        if(state is InitFoodState){
                          _bloc.getRecipes();
                        }
                        if(state is RecipeListState)
                          return getHorizontalListView(true, (state).recipeList.reversed.toList());
                        else return Container();
                      } ,
                    )
                ),
                SizedBox(height: 5,),
                Text("Popular Recipies:", style: TextStyle(fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.bold)),
                SizedBox(height: 15,),
                Expanded(child:BlocBuilder<HomeFoodCubit, FoodState>(
                  buildWhen: (FoodState previousState, FoodState currentState) => currentState is RecipeListState,
                  builder: (context, state) => state is RecipeListState? getHorizontalListView(false, (state).recipeList):Container()
                  ,
                ))
              ],
            ),
          ),
        ),
      ),

    );
  }

  ListView getHorizontalListView(bool horizontal, List<Recipe> list){
    return ListView.separated(
      scrollDirection: horizontal? Axis.horizontal:Axis.vertical,
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            expireSession();
            //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>RecipeDetailsScreen(recipe: list[index],)));
          },
          child: Container(
            width: 120,
            height:120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    child: list[index].image != null? FadeInImage.assetNetwork(image: list[index].image,
                      placeholder: 'images/loading_image.png',height: 90, width: 117, fit: BoxFit.cover,): Image.asset('images/loading_image.png'),
                    borderRadius: BorderRadius.all(Radius.circular(7.0),),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(child: Text(list[index].title, style: TextStyle(fontSize: 12, color: Colors.brown[300], fontWeight: FontWeight.bold), overflow: horizontal? null:TextOverflow.ellipsis,)),

              ],
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return SizedBox(
        width: horizontal?10:0,
        height: horizontal?0:10,
      );
    },);
  }


  TextFormField getSearchField() {
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Search",
        prefixIcon: Icon(Icons.search),
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
        ),
      ),
      style: new TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }


}
