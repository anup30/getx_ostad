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
//at 21:00
class ControllerBinder extends Bindings{ // <--- controller binder
  @override
  void dependencies() {
    //Get.put(CounterController());
    // ^ or, lazy put // different initialize order for CounterController -- when tries to find.
    Get.lazyPut(() => CounterController());
  }

}