import 'package:flutter/material.dart';
class LastBottomScreens extends StatefulWidget {
  const LastBottomScreens({Key? key}) : super(key: key);

  @override
  State<LastBottomScreens> createState() => _LastBottomScreensState();
}

class _LastBottomScreensState extends State<LastBottomScreens> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Last bottom screens")),
      body: const Column(
        children: [

        ],
      ),
    );
  }
}
