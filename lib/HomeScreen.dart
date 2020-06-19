import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodflutterapp/Models.dart';
import 'package:foodflutterapp/RecipeDetailsScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = [];
  List<Recipe> recipesReversed = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                child: getHorizontalListView(true, recipes),
              ),
              SizedBox(height: 5,),
              Text("Popular Recipies:", style: TextStyle(fontSize: 20, color: Colors.grey[800], fontWeight: FontWeight.bold)),
              SizedBox(height: 15,),
              Expanded(child: getHorizontalListView(false, recipesReversed))
            ],
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
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>RecipeDetailsScreen(recipe: list[index],)));
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


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.getRecipes();
    });
  }

  showAlertDialog(){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" , style: TextStyle(color: Colors.brown[300]),)),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  void getRecipes () async{
    showAlertDialog();
   List<Recipe> recList = await getAllRecipes();
    print("recList.length ${recList.length}");
   Navigator.pop(context);
    setState(() {
      if(recList == null || recList.isEmpty){
        Fluttertoast.showToast(
            msg: "Error getting recipies",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1
        );
      }else {
          this.recipes = recList;
          this.recipesReversed = recList.reversed.toList();
      }
    });
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
