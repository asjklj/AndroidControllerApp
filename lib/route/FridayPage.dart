import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io'; //导IO包
import 'dart:convert';
// import '../tabs/setTime.dart';
// import 'package:dio/dio.dart';

import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/tabs/setTime.dart'; //解码和编码JSON

// gettime();

class FridayPage extends StatefulWidget {
  const FridayPage({super.key});

  @override
  State<FridayPage> createState() => _FridayPageState();
}

class _FridayPageState extends State<FridayPage> {
  int _count = 0;
  List<double> _sliderValue01 = [0];
  List<double> _sliderValue02 = [0];
  List<double> _sliderValue03 = [0];
  List<double> _sliderValue04 = [0];

  // FutureBuilder(
  //   future: Future,
  //   initialData: InitialData,
  //   builder: (BuildContext context, AsyncSnapshot snapshot) {
  //     return ;
  //   },
  // ),

  void gettime() async {
    String responseBody;
    //1.创建HttpClient
    var httpClient = new HttpClient();
    //2.构造Uri
    var request = await httpClient
        .getUrl(Uri.parse("http://81.68.216.118:9094/api/get/timeon/3"));
    //3.关闭请求，等待响应
    var response = await request.close();
    //4.进行解码，获取数据
    // if (response.statusCode == 200) {
    //拿到请求的数据
    responseBody = await response.transform(utf8.decoder).join();
    //先不解析打印数据
    Map<String, dynamic> map = json.decode(responseBody);
    _count = map['length']; //获取时间段的个数
    for (int i = 0; i < _count; ++i) {
      _sliderValue01.add(map['time'][i]['H_start'] / 1); //获取h_start
      _sliderValue02.add(map['time'][i]['M_start'] / 1); //获取m_start
      _sliderValue03.add(map['time'][i]['H_end'] / 1); //获取h_end
      _sliderValue04.add(map['time'][i]['M_end'] / 1); //获取m_end
    }
    // }
  }

  void initState() {
    setState(() {
      // gettime();
    });
  }

  @override
  Widget build(BuildContext context) {
    // testFuture();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 83, 63, 63), size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "设置周五时间",
          style: TextStyle(
              color: Colors.blue,
              fontFamily: "STKaiti",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: (() {
                setState(() {});
              }),
              icon: Icon(
                Icons.refresh,
                size: 40,
                color: Colors.green,
              )),
          IconButton(
            onPressed: ((() {
              setState(() {});
            })),
//               () async {
//               // void posttime() async {
//               //   // var responseBody;
//               List Time = [];
//               for (int i = 1; i <= _count; ++i) {
//                 Time.add({
//                   "H_start": _sliderValue01[i].toInt(),
//                   "M_start": _sliderValue02[i].toInt(),
//                   "H_end": _sliderValue03[i].toInt(),
//                   "M_end": _sliderValue04[i].toInt()
//                 }
//                 );
//               }
// //               Response response;
// //               var dio = Dio();
// //               dio.options.baseUrl =
// //                   'http://81.68.216.118:9094/api/post/timeon/updateall/3';
// // // dio.options.connectTimeout = 100; //5s
// // // dio.options.receiveTimeout = 3000;
// //               response = await dio.post('/time', data: Time);
//               // }

//               // posttime();
//             }

            icon: const Icon(
              Icons.send,
              size: 40,
              color: Colors.blue,
            ),
          ),
          Container(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _count,
                itemBuilder: (context, count) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 30,
                            child: Text(
                              "时间段${count + 1}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 24, 139, 240),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  if (count + 1 == _count) {
                                    _sliderValue01.removeAt(_count);
                                    _sliderValue02.removeAt(_count);
                                    _sliderValue03.removeAt(_count);
                                    _sliderValue04.removeAt(_count);
                                    _count--;
                                    // print("${this._count}");
                                    // }
                                  } else {
                                    for (int i = count + 1; i < _count; ++i) {
                                      _sliderValue01[i] = _sliderValue01[i + 1];
                                      _sliderValue02[i] = _sliderValue02[i + 1];
                                      _sliderValue03[i] = _sliderValue03[i + 1];
                                      _sliderValue04[i] = _sliderValue04[i + 1];
                                    }
                                    _sliderValue01.removeAt(_count);
                                    _sliderValue02.removeAt(_count);
                                    _sliderValue03.removeAt(_count);
                                    _sliderValue04.removeAt(_count);
                                    _count--;
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            " 设置开始小时:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 40, 96, 142)),
                          ),
                          Transform.scale(
                            scale: 1,
                            child: Slider(
                                value: _sliderValue01[count + 1],
                                onChanged: (data) {
                                  // print('change:$data');
                                  setState(() {
                                    _sliderValue01[count + 1] = data;
                                  });
                                },
                                onChangeStart: (data) {
                                  // print('start:$data');
                                },
                                onChangeEnd: (data) {
                                  // print('end:$data');
                                },
                                min: 0,
                                max: 24,
                                divisions: 24,
                                label: '${_sliderValue01[count + 1].toInt()}',
                                activeColor: Color.fromARGB(255, 88, 164, 227),
                                inactiveColor: Colors.grey,
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()} dollars}';
                                }),
                          ),
                          Text(
                            "设为:${_sliderValue01[count + 1].toInt()}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 15, 84, 140),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            " 设置开始分钟:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 40, 96, 142)),
                          ),
                          Transform.scale(
                            scaleX: 1,
                            child: Slider(
                                value: _sliderValue02[count + 1],
                                onChanged: (data) {
                                  // print('change:$data');
                                  setState(() {
                                    _sliderValue02[count + 1] = data;
                                  });
                                },
                                onChangeStart: (data) {
                                  // print('start:$data');
                                },
                                onChangeEnd: (data) {
                                  // print('end:$data');
                                },
                                min: 0,
                                max: 60,
                                divisions: 60,
                                label: '${_sliderValue02[count + 1].toInt()}',
                                activeColor: Color.fromARGB(255, 88, 164, 227),
                                inactiveColor: Colors.grey,
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()} dollars}';
                                }),
                          ),
                          Text("设为:${_sliderValue02[count + 1].toInt()}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 15, 84, 140),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            " 设置结束小时:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 40, 96, 142)),
                          ),
                          Transform.scale(
                            scale: 1,
                            child: Slider(
                                value: _sliderValue03[count + 1],
                                onChanged: (data) {
                                  // print('change:$data');
                                  setState(() {
                                    _sliderValue03[count + 1] = data;
                                  });
                                },
                                onChangeStart: (data) {
                                  // print('start:$data');
                                },
                                onChangeEnd: (data) {
                                  // print('end:$data');
                                },
                                min: 0,
                                max: 24,
                                divisions: 24,
                                label: '${_sliderValue03[count + 1].toInt()}',
                                activeColor: Color.fromARGB(255, 88, 164, 227),
                                inactiveColor: Colors.grey,
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()} dollars}';
                                }),
                          ),
                          Text("设为:${_sliderValue03[count + 1].toInt()}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 15, 84, 140),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            " 设置结束分钟:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 40, 96, 142)),
                          ),
                          Transform.scale(
                            scale: 1,
                            child: Slider(
                                value: _sliderValue04[count + 1],
                                onChanged: (data) {
                                  // print('change:$data');
                                  setState(() {
                                    _sliderValue04[count + 1] = data;
                                  });
                                },
                                onChangeStart: (data) {
                                  // print('start:$data');
                                },
                                onChangeEnd: (data) {
                                  // print('end:$data');
                                },
                                min: 0,
                                max: 60,
                                divisions: 60,
                                label: '${_sliderValue04[count + 1].toInt()}',
                                activeColor: Color.fromARGB(255, 88, 164, 227),
                                inactiveColor: Colors.grey,
                                semanticFormatterCallback: (double newValue) {
                                  return '${newValue.round()} dollars}';
                                }),
                          ),
                          Text("设为:${_sliderValue04[count + 1].toInt()}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 15, 84, 140),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 116, 159, 194),
          onPressed: () {
            setState(() {
              _count++;
              _sliderValue01.add(0 / 1);
              _sliderValue02.add(0 / 1);
              _sliderValue03.add(0 / 1);
              _sliderValue04.add(0 / 1);
            });
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomSheet: ,
    );
  }

  // void posttime() async {
  //   var httpClient = new HttpClient();
  //   // int n = SelectedValue[index];
  //   // String m = conditioner[index - 1];
  //   // String s = "$m?num=$n";
  //   // // var uri = Uri(
  //   //     scheme: 'http',
  //   //     host: '81.68.216.118',
  //   //     path: ':9090/api/post/airset/temp',
  //   //     queryParameters: {'temp':26});
  //   // var uri2=Uri.https('www.wanandroid.com', '/user/login',{'username': 'wanandroidUser1', 'password': '123456'});
  //   HttpClientRequest request = await httpClient
  //       .postUrl(Uri.parse("http://81.68.216.118:9090/api/post/airset/"));
  //   HttpClientResponse response = await request.close();
  //   if (response.statusCode == 200) {
  //     String responseBody = await response.transform(utf8.decoder).join();
  //   }
  // }
}

// void gettime() async {
//   String responseBody;
//   //1.创建HttpClient
//   var httpClient = new HttpClient();
//   //2.构造Uri
//   var request = await httpClient
//       .getUrl(Uri.parse("http://81.68.216.118:9094/api/get/timeon/3"));
//   //3.关闭请求，等待响应
//   var response = await request.close();
//   //4.进行解码，获取数据
//   // if (response.statusCode == 200) {
//   //拿到请求的数据
//   responseBody = await response.transform(utf8.decoder).join();
//   //先不解析打印数据
//   Map<String, dynamic> map = json.decode(responseBody);
//   _count = map['length']; //获取时间段的个数
//   for (int i = 1; i <= _count; ++i) {
//     _sliderValue01.add(map['time'][i - 1]['H_start'] / 1); //获取h_start
//     _sliderValue02.add(map['time'][i - 1]['M_start'] / 1); //获取m_start
//     _sliderValue03.add(map['time'][i - 1]['H_end'] / 1); //获取h_end
//     _sliderValue04.add(map['time'][i - 1]['M_end'] / 1); //获取m_end
//   }
//   // }
// }

