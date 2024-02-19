import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const GetMaterialApp(home: MyApp()));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller countController = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed. => Instead of setState()
        appBar: AppBar(title: const Text("Home Screen")),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Clicks: ${countController.count}",
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(height: 10),
            ElevatedButton(child: const Text("Go to Result"), onPressed: () => Get.to(ResultScreen())),
          ],
        )),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: countController.increment));
  }
}

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller controller = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Result Screen"),
        ),

        // Access the updated count variable
        body: Center(child: Text("Result is ${controller.count}")));
  }
}
