import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
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