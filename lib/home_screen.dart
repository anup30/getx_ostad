import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ostad/counter_controller.dart';
import 'package:getx_ostad/profile_screen.dart';
import 'package:getx_ostad/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int _counter =0;
  //final CounterController _counterController = CounterController();
  //final CounterController _counterController = Get.put(CounterController());
  //final CounterController _counterController = Get.find<CounterController>(); // find if previously put in another page. (in main.dart)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(() =>
            //   Text(
            //     '${_counterController.counter}',
            //     style:
            //         const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //   ),
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
                      //_counterController.increment();
                      Get.find<CounterController>().increment();
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
                      //_counterController.decrement();
                      Get.find<CounterController>().decrement();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen()));
                  //Get.to(ProfileScreen());
                  Get.to(()=> const ProfileScreen()); /// GetMaterialApp or Get.key needed
                },
                child: const Text('go to  Profile Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));
                Get.to(()=> const SettingsScreen()); // also, Get.toNamed
              },
              child: const Text('go to  Settings Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
