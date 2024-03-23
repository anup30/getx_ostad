// getx(/get), module 19
// getx navigation, state management,
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ostad/home_screen.dart';

void main(){runApp(const CounterApp()); }

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp( // instead of MaterialApp, for Get routing
      home: HomeScreen(),
    );
  }
}

