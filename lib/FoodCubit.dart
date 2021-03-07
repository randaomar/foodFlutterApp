import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodflutterapp/FoodState.dart';

import 'Utils.dart';

 abstract class FoodCubit extends Cubit<FoodState> {
 Stream _refreshStream = refreshDataStreamController.stream;
 Stream _expireSessionStream = sessionExpiredStreamController.stream;
 StreamSubscription<void> _refreshStreamSubscription;
 StreamSubscription<void> _expireSessionStreamSubscription;
  FoodCubit(FoodState initialState) : super(initialState){
   _refreshStreamSubscription = _refreshStream.listen((event) {
     refreshData();
   });
   _expireSessionStreamSubscription = _expireSessionStream.listen((event) {
     emit(ExpiredSessionState());
   });
  }

 String getTitle();
 //here we will be adding events to the bloc that triggers the mapToState
 void refreshData();

  @override
  Future<void> close() {
    _refreshStreamSubscription.cancel();
    _expireSessionStreamSubscription.cancel();
    return super.close();
  }

}