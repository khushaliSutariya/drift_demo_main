
import 'dart:async';

import 'package:drift_demo_main/screens/bottomsheet/bottomscreens.dart';
import 'package:drift_demo_main/screens/bottomsheet/secondbottomscreens.dart';
import 'package:drift_demo_main/screens/stream/ProgressIndicatorScreen.dart';
import 'package:drift_demo_main/screens/stream/ffb.dart';
import 'package:drift_demo_main/screens/stream/firestscreens.dart';
import 'package:flutter/material.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:provider/provider.dart';

void main() {
  late SchemaVerifier verifier;

 /*setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('upgrade from v1 to v2', () async {
    final connection = await verifier.startAt(1);
    final db = AppDatabase.appDatabase;
    await verifier.migrateAndValidate(db, 2);
  });*/
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:    BottomScreens(),

    );
  }
}


