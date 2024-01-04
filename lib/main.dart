
import 'package:flutter/material.dart';
import 'package:rain_animation_challenge/rain_animation.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(
                children: _items(context)
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _items(BuildContext context){
    List<Widget> items = <Widget>[];
    for(int i = 0; i < 200; i++){
      items.add(Rain(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
      ));
    }
    return items;
  }
}
