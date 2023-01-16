import 'package:flutter/material.dart';
import './statement.dart';
import './home.dart';
import './setTime.dart';

class Tabs extends StatefulWidget {
  //底部导航栏选择
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [HomePage(), Statement(), SetTime()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("桌上智能辅助空调控制盒移动端",style: TextStyle(color: Color.fromARGB(255, 95, 140, 217),fontSize: 20),textAlign: TextAlign.center,)),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Color.fromARGB(255, 98, 166, 222),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(
                icon: Icon(Icons.display_settings), label: "状态"),
            BottomNavigationBarItem(icon: Icon(Icons.add_alarm), label: "定时")
          ]),
    );
  }
}
