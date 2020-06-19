
import 'package:flutter/material.dart';
import 'package:foodflutterapp/Styles.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset('images/food_main.jpg',  height: double.infinity, width: double.infinity, fit: BoxFit.cover, ),
          ),
          Positioned.fill( top: 60, child:
          Align(
            alignment: Alignment.topCenter, child:
          Column(
            children: <Widget>[
              Text("Randa's Cuisine", style: TextStyle(color: Colors.white, fontSize: 30),),
              SizedBox(height: 20),
              Text("Simply Delecious", style: TextStyle(color: Colors.white, fontSize: 20),),
            ],
         )
            ,)
          ),
          Positioned.fill(bottom: 60, left: 50, right: 50,child:
          Align(alignment: Alignment.bottomCenter, child:
          SizedBox(
            width: double.infinity,
            child: FlatButton(
                child: JessesStyle(text: "Hi We are using Jesse's Style"),
                textColor: Colors.brown[200],
                onPressed: (){
                  Navigator.pushNamed(context, '/home');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.brown[200])
              ),
            ),
          )
            ,)
          )
        ],
      ),
    );
  }
}


