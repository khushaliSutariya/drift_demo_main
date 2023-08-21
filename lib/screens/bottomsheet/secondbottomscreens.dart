import 'package:flutter/material.dart';

class SecondBottomScreens extends StatefulWidget {
  const SecondBottomScreens({Key? key}) : super(key: key);

  @override
  State<SecondBottomScreens> createState() => _SecondBottomScreensState();
}

class _SecondBottomScreensState extends State<SecondBottomScreens> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Second bottom screens")),

      body: const Column(
        children: [],
      ),
    );
  }
}
