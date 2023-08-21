import 'package:drift_demo_main/screens/bottomsheet/bottomscreens.dart';
import 'package:drift_demo_main/screens/bottomsheet/secondbottomscreens.dart';
import 'package:flutter/material.dart';
class FirstBottomScreens extends StatefulWidget {
  final dynamic tap;
  const FirstBottomScreens({Key? key, this.tap}) : super(key: key);

  @override
  State<FirstBottomScreens> createState() => _FirstBottomScreensState();
}

class _FirstBottomScreensState extends State<FirstBottomScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First bottom screens")),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            widget.tap(2);
          }, child: const Text("Go to next screens"))
        ],
      ),
    );
  }
  }

