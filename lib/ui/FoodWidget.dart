import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodflutterapp/FoodCubit.dart';
import 'package:foodflutterapp/FoodState.dart';
import 'package:flutter/material.dart';


abstract class FoodWidget<B extends FoodCubit> extends StatelessWidget {
   Widget buildFoodWidget(buildContext);
  @override
  Widget build(BuildContext context) {
    return BlocListener<B, FoodState>(child: buildFoodWidget(context),
        listener: (context, state) {
          if(state is ExpiredSessionState){
            showExpiredAlertDialog(context);
          }
        });
  }

  showExpiredAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Session Expired"),
      content: Text("Sorry Session Expired...GO AWAY!."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
