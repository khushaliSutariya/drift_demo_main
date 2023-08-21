import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress App'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => ProgressIndicatorItem(index),
        ),
      ),
    );
  }
}

class ProgressIndicatorItem extends StatefulWidget {
  final int index;

  const ProgressIndicatorItem(this.index, {super.key});

  @override
  State<ProgressIndicatorItem> createState() => _ProgressIndicatorItemState();
}

class _ProgressIndicatorItemState extends State<ProgressIndicatorItem> {

  @override
  Widget build(BuildContext context) {
    int progressValue = Provider.of<int>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            value: (widget.index == 0) ? progressValue / 100 : 0.0,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (widget.index == 0) {
                _startProgress(context);
              }
            },
            child: Text('Start Progress ${widget.index + 1}'),
          ),
        ],
      ),
    );
  }

  void _startProgress(BuildContext context) {
    int value = 0;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (value <= 100) {
        Provider.of<int>(context, listen: false).abs();
        value++;
      } else {
        timer.cancel();
      }
    });
  }
}