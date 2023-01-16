import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child:Column(children: [Image(image:AssetImage('images/gongdao.jpg') ,fit:BoxFit.cover ,),Text(
  """使用指南:
1.点击“状态”可以查看并设置当前空调设置
(偏好3为正常且数字越小空调自动设置越冷;
风速数值越大越高)
2.点击“定时”可以设置需要空调开启的时间""",style:TextStyle(color: Color.fromARGB(255, 45, 123, 186)))]) ,) ;
  }
}
