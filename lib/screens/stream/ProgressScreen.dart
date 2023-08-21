import 'dart:async';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final StreamController<double> _progress1Controller = StreamController<double>();

  final StreamController<double> _progress2Controller = StreamController<double>();

  final double _totalProgress = 100.0;

  final double _increment = 5.0;

  Stream<double> get progress1Stream => _progress1Controller.stream;

  Stream<double> get progress2Stream => _progress2Controller.stream;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startProgress();
  }
  @override
  void dispose() {
    _progress1Controller.close();
    _progress2Controller.close();
  }
  void _startProgress() {
    double progress = 0;
    const duration = Duration(milliseconds: 100);

    void addProgress() {
      progress += _increment;
      _progress1Controller.add(progress);
      if (progress < _totalProgress) {
        Future.delayed(duration, addProgress);
      } else {
        _startNextProgress();
      }
    }
    addProgress();
  }

  void _startNextProgress() {
    double progress = 0;
    const duration = Duration(seconds: 2);
    void updateProgress() {
      progress += _increment;
      if (progress <= _totalProgress) {
        _progress2Controller.add(progress);
        Future.delayed(duration, updateProgress);
      }
    }

    updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Progress Indicators'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<double>(
                stream: progress1Stream,
                initialData: 0.0,
                builder: (context, snapshot) {
                  return CircularProgressIndicator(
                    value: snapshot.data! / _totalProgress,
                  );
                },
              ),
              const SizedBox(height: 20),
              StreamBuilder<double>(
                stream: progress2Stream,
                initialData: 0.0,
                builder: (context, snapshot) {
                  return CircularProgressIndicator(
                    value: snapshot.data! / _totalProgress,
                  );
                },
              ),
            ],
          ),
        ),

    );
  }


}


