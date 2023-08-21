import 'dart:async';
import 'package:flutter/material.dart';

class ProgressIndicatorScreen extends StatefulWidget {
  const ProgressIndicatorScreen({Key? key}) : super(key: key);
  @override
  State<ProgressIndicatorScreen> createState() => _ProgressIndicatorScreenState();
}

class _ProgressIndicatorScreenState extends State<ProgressIndicatorScreen> {
  final StreamController<int> _progressController = StreamController<int>.broadcast();
  int _progressValue = 0;
  Stream<int> get stream => _progressController.stream;
  bool firstProgress = false;
  List<int> myList = [
    1,
    2,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startProgress();

  }
  void addProgress(){
    Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      for(int i = 0 ; i< myList.length;i++){
        _progressValue++;
        if (_progressValue > 100) {
          timer.cancel();
          firstProgress = false;
        } else {
          _progressController.sink.add(_progressValue);
        }

      }
    });

  }
  void _startProgress() {
    _progressValue = 0;
     stream.listen((event) {
      print('Subscriber1: $event');
      setState(() {
        _progressValue = event;
      });
    },);
    addProgress();
  }



  @override
  void dispose() async{
    super.dispose();
   await _progressController.close();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicator with Stream')),
      body:  ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text("MyList: ${index + 1}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: _progressValue/100,
                minHeight: 20.0,
                backgroundColor: Colors.black,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
          ],
        );
      },
    ),
    );
  }


}
