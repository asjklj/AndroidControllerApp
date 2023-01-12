import 'package:flutter/material.dart';
class SetTime extends StatefulWidget {
  const SetTime({super.key});

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {

List<Widget>_setListData(){ 
  List<Widget> list=[];
  for(var i=1;i<=7;i++){
    list.add(ListTile(title:Text("day$i"),));
    }
    return list;
}
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _setListData()
    );
  }
}
