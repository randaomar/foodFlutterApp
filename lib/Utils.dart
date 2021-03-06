import 'dart:async';

StreamController <void> refreshDataStreamController = StreamController<void>();
StreamController <void>sessionExpiredStreamController = StreamController<void>();
 void changeLocation(int x){
    if(x > 5){
      void v;
      refreshDataStreamController.add(v);
    }
 }

 void expireSession(){
   void v;
   sessionExpiredStreamController.add(v);
 }