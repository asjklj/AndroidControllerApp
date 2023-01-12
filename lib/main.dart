import 'package:flutter/material.dart';
import './tabs/tabs.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'桌上智能辅助空调控制盒app',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Tabs(),
      );
  }
}
