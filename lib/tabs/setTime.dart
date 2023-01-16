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
    "Wenesday",
    "Thursday",
    "Friday",
    "Saterday",
    "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(weekday[i]),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, weekday[i]); // do something
            },
          );
        });
  }
}
