import 'dart:async';

import 'package:flutter/material.dart';

class FirstScreens extends StatefulWidget {
  const FirstScreens({Key? key}) : super(key: key);

  @override
  State<FirstScreens> createState() => _FirstScreensState();
}

class _FirstScreensState extends State<FirstScreens> {
  StreamController<List<String>> controller = StreamController<List<String>>.broadcast();
  double _value = 0.0;
  late List<String> _tasks = [];
  bool _showProgress = true;
  bool _showProgress1 = false;

  Stream<List<String>> get stream => controller.stream;
  void delayTime() async {
    await Future.delayed(const Duration(seconds: 3));
  }

void getData(String task) {
    StreamSubscription<List<String>> subscriber1 = stream.listen((List<String> dataAdd) {
      print('Subscriber1: $dataAdd');
      setState(() {
        _tasks = dataAdd;
        _showProgress = false;
        _showProgress1 = true;
      });
      },
        onError: (error) {
          print('Subscriber1: $error');
        },
        onDone: () {
          print('Subscriber1: Stream closed');
        });
    delayTime();
    _tasks.add(task);

    controller.sink.add(_tasks);
    delayTime();
    controller.addError('Error');
    delayTime();
    controller.close();
  }


  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) => setState(
            () {
          if (_value == 1) {
            timer.cancel();
          } else {
            _value += 0.2;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData("new task ${_tasks.length + 1}");
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stream")),
      body: StreamBuilder<List<String>>(
        stream: stream,
        initialData: _tasks,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text("Data: ${snapshot.data![index]}"),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: LinearProgressIndicator(
                        value: _value,
                        minHeight: 20.0,
                        backgroundColor: Colors.black,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green,),

                      ),),
                  ],
                );
              },

            );
          } else if( snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          else{
            return const Center(child: Text("Waiting for data"));

          }
        },
      ),
    );
  }
}
