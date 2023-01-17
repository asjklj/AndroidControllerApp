import 'package:flutter/material.dart';

class SetTime extends StatefulWidget {
  const SetTime({super.key});

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {
  // List<Widget> _setListData() {
  //   List<Widget> list = [];
  //   for (var i = 1; i <= 7; i++) {
  //     list.add(ListTile(
  //       title: Text("day$i"),
  //     ));
  //   }
  //   return ;
  // }
  List weekday = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List WeekDay = [
    "周一",
    "周二",
    "周三",
    "周四",
    "周五",
    "周六",
    "周日",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(
              WeekDay[i],
              style: TextStyle(
                  color: Color.fromARGB(255, 74, 120, 159), fontSize: 18),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              color: Color.fromARGB(255, 2, 103, 186),
            ),
            onTap: () {
              Navigator.pushNamed(context, weekday[i]); // do something
            },
          );
        });
  }
}
