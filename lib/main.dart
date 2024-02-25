import 'package:flutter/material.dart';
import 'package:instaclone/MyHomePage.dart';

/////////////////////////////////////////// NOTE //////////////////////////////////////////////
// this is instagram clone you can add backend to this project and modify as per your choice //
// Create By AkkiSaysChill :)                                                                //
///////////////////////////////////////////////////////////////////////////////////////////////

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}




