import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ostad/profile_screen.dart';

import 'counter_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final CounterController _counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SettingsScreen'),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(() =>
            //     Text(
            //       '${_counterController.counter}',
            //       style:
            //       const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //     ),
            // ),
            GetBuilder<CounterController>(
                builder: (counterController){
                  return Text(
                    '${counterController.counter}', // or, _counterController.counter
                    style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      _counterController.increment();
                      //setState(() {}); // not needed for getx Obx()
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      _counterController.decrement();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
                Get.off(()=> const ProfileScreen()); // ^ same as, pops current screen and push.
              },
              child: const Text('go to  Profile Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.pop(context);
                Get.back(); // ^ can use both
              },
              child: const Text('back'),
            ),
          ],
        ),
      ),
    );
  }
}