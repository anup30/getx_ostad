import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ostad/counter_controller.dart';
import 'package:getx_ostad/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileScreen'),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(
                builder: (controller){
                  return Text(
                    '${controller.counter}', // or, _counterController.counter
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
                      Get.find<CounterController>().decrement();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const HomeScreen()),(route)=>false);
                Get.offAll(()=> const HomeScreen()); // ^same as // push first, then remove navigation stack.
                //Get.offUntil, Get.offNamedUntil
              },
              child: const Text('go Home Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.dialog(const AlertDialog(title: Text('AlertDialog title'),));
              },
              child: const Text('show dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.showSnackbar(
                   const GetSnackBar( // or, SnackBar
                    title: 'title',
                    message: 'message',
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: const Text('show GetSnackBar'),
            ),

          ],
        ),
      ),
    );
  }
}