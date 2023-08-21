import 'package:flutter/material.dart';

class ValueChangeScreens extends StatefulWidget {
  final ValueChanged<dynamic> tap;
  const ValueChangeScreens({Key? key, required this.tap}) : super(key: key);

  @override
  State<ValueChangeScreens> createState() => _ValueChangeScreensState();
}

class _ValueChangeScreensState extends State<ValueChangeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Value change screens")),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            widget.tap(1);
          }, child: const Text("Go to next screens"))
        ],
      ),
    );
  }
}
