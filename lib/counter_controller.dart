import 'package:get/get.dart';

/*
class CounterController{ // this example separates ui from business logic
  RxInt counter= 0.obs; // <--- Reactive approach
  void increment(){
    counter++; // setState isn't required
  }
  void decrement(){
    counter--;
  }
}
*/

///*
class CounterController extends GetxController{ // -> preferred approach
  int counter=0; //non obs
  void increment(){
    counter++;
    update(); //similar as setState
  }
  void decrement(){
    counter--;
    update();
  }
}
//*/