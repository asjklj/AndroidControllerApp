import 'package:flutter/material.dart';
import 'dart:io'; //导IO包
import 'dart:convert';

import 'package:flutter/scheduler.dart'; //解码和编码JSON

List SelectedValue = [1,2,1,2,24,1];
List conditioner=["pref","mode","speed","temp","onoff"];
bool flag = true;

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  void initState() {
    // TODO: implement initState
    GetStatement();  
    setState(() {});
  }
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1,
      padding: const EdgeInsets.all(20),
      children: [
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 243, 248),
              border: Border.all(color: Color.fromARGB(255, 142, 189, 227)),

              image: DecorationImage(image: NetworkImage(""),fit: BoxFit.cover),
              // boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 20.0)],
              // gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("偏好 :",style: TextStyle(color: Color.fromARGB(255, 44, 108, 161),fontSize: 20),),
              DropdownButton(
                style: TextStyle(color:Color.fromARGB(255, 22, 72, 113),fontSize: 20),
                value: SelectedValue[1],
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("1"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("2"),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text("3"),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Text("4"),
                  ),
                  DropdownMenuItem(
                    value: 5,
                    child: Text("5"),
                  ),
                ],
                onChanged: (value) {
                  SelectedValue[1] = value!;
                  setState(() {
                    PostStatement(1);
                    GetStatement();
                  });
                },
              )
            ])),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                            color: Color.fromARGB(255, 237, 243, 248),
              image: DecorationImage(image: NetworkImage(""),fit: BoxFit.cover),
               border: Border.all(color: Color.fromARGB(255, 142, 189, 227)),

              // boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 20.0)],
              // gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("模式 :",style: TextStyle(color: Color.fromARGB(255, 44, 108, 161),fontSize: 20),),
              DropdownButton(
                style: TextStyle(color:Color.fromARGB(255, 22, 72, 113),fontSize: 20),
                value: SelectedValue[2],
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("制冷"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("送风"),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text("制热"),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Text("除湿"),
                  ),
                   DropdownMenuItem(
                    value: 5,
                    child: Text("自动"),
                  ),
                ],
                onChanged: (value) {
                  SelectedValue[2] = value!;
                  setState(() {
                    PostStatement(2);
                    GetStatement();
                  });
                },
              )
            ])),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 243, 248),
              border: Border.all(color: Color.fromARGB(255, 142, 189, 227)),
              image: DecorationImage(image: NetworkImage("https://www.iconfinder.com/icons/9025042/wind_weather_icon"),fit: BoxFit.cover),
              // boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 20.0)],
              // gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("风速 :",style: TextStyle(color: Color.fromARGB(255, 44, 108, 161),fontSize: 20),),
              DropdownButton(
                style: TextStyle(color:Color.fromARGB(255, 22, 72, 113),fontSize: 20),
                value: SelectedValue[3],
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("1"),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text("2"),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text("3"),
                  ),
                ],
                onChanged: (value) {
                  SelectedValue[3] = value!;
                  setState(() {
                     PostStatement(3);
                     GetStatement();
                     
                  });
                },
              )
            ])),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 243, 248),
              image: DecorationImage(image: NetworkImage(""),fit: BoxFit.cover),
              border: Border.all(color: Color.fromARGB(255, 142, 189, 227)),
              // boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 20.0)],
              // gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("温度 :",style: TextStyle(color: Color.fromARGB(255, 44, 108, 161),fontSize: 20),),
              DropdownButton(
                style: TextStyle(color:Color.fromARGB(255, 22, 72, 113),fontSize: 20),
                value: SelectedValue[4],
                items: const [
                  DropdownMenuItem(
                    value: 20,
                    child: Text("20℃"),
                  ),
                  DropdownMenuItem(
                    value: 21,
                    child: Text("21℃"),
                  ),
                  DropdownMenuItem(
                    value: 22,
                    child: Text("22℃"),
                  ),
                  DropdownMenuItem(
                    value: 23,
                    child: Text("23℃"),
                  ),
                  DropdownMenuItem(
                    value: 24,
                    child: Text("24℃"),
                  ),
                  DropdownMenuItem(
                    value: 25,
                    child: Text("25℃"),
                  ),
                  DropdownMenuItem(
                    value: 26,
                    child: Text("26℃"),
                  ),
                  DropdownMenuItem(
                    value: 27,
                    child: Text("27℃"),
                  ),
                  DropdownMenuItem(
                    value: 28,
                    child: Text("28℃"),
                  ),
                ],
                onChanged: (value) {
                  SelectedValue[4] = value!;
                  setState(() {
                    PostStatement(4);
                    GetStatement();
                  });
                },
              )
            ])),
        Container(
          alignment: Alignment.centerRight,
          child: const Text(
            "开关:",
            style: TextStyle(
              color: Color.fromARGB(255, 74, 143, 200),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Transform.scale(
            scale: 2.0,
            child: Switch(
              activeColor: Color.fromARGB(255, 67, 136, 193),
              activeTrackColor: Color.fromARGB(255, 99, 177, 240),
                value: flag,
                onChanged: ((value) {
                  setState(() {
                    if(value==false){flag=false;SelectedValue[5]=0;}
                    else {flag=true;SelectedValue[5]=1;}                    
                    PostStatement(5);
                    GetStatement();
                  });
                })),
          ),
        )
      ],
    );
  }
}

void GetStatement() async {
  String responseBody;
  //1.创建HttpClient
  var httpClient = new HttpClient();
  //2.构造Uri
  var request = await httpClient
      .getUrl(Uri.parse("http://81.68.216.118:9094/api/get/airset/"));
  //3.关闭请求，等待响应
  var response = await request.close();
  //4.进行解码，获取数据
  if (response.statusCode == 200) {
    //拿到请求的数据
    responseBody = await response.transform(utf8.decoder).join();
    //先不解析打印数据
    Map<String, dynamic> map = json.decode(responseBody);
    SelectedValue[1] = map['pref'];
    SelectedValue[2] = map['mode'];
    SelectedValue[3] = map['speed'];
    SelectedValue[4] = map['temp'];
    SelectedValue[5]= map['on_off'];
    if (SelectedValue[5]==0) {flag=false;}
    else {flag=true;}
  }
}

void PostStatement(index) async {
  var httpClient = new HttpClient();
  int n=SelectedValue[index];
  String m=conditioner[index-1];
  String s = "$m?num=$n";
  // var uri = Uri(
  //     scheme: 'http',
  //     host: '81.68.216.118',
  //     path: ':9090/api/post/airset/temp',
  //     queryParameters: {'temp':26});
  // var uri2=Uri.https('www.wanandroid.com', '/user/login',{'username': 'wanandroidUser1', 'password': '123456'});
  HttpClientRequest request = await httpClient
      .postUrl(Uri.parse("http://81.68.216.118:9094/api/post/airset/$s"));
  HttpClientResponse response = await request.close();
  if (response.statusCode == 200) {
    String responseBody = await response.transform(utf8.decoder).join();
  }
}
