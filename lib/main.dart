// getx(/get), module 19
// getx navigation, state management,
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ostad/counter_controller.dart';
import 'package:getx_ostad/home_screen.dart';

void main(){runApp(const CounterApp()); }

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // instead of MaterialApp, for Get routing
      home: const HomeScreen(),
      initialBinding: ControllerBinder(), // for Get.put here, can use Get.find everywhere in project.
    );
  }
}
class ControllerBinder extends Bindings{ // <--- controller binder
  @override
  void dependencies() {
    //Get.put(CounterController()); //ok
    // ^ or, lazy put // different initialize order for CounterController -- when tries to find.
    //Get.put(()=>CounterController()); // error: "CounterController" not found.
    Get.lazyPut(() => CounterController()); // working with default fenix:false,
  }
}