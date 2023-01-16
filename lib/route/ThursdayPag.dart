import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:io'; //导IO包
import 'dart:convert';
// import '../tabs/setTime.dart';

import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/tabs/setTime.dart'; //解码和编码JSON

// gettime();

class ThursdayPage extends StatefulWidget {
  const ThursdayPage({super.key});

  @override
  State<ThursdayPage> createState() => _ThursdayPageState();
}

class _ThursdayPageState extends State<ThursdayPage> {
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
        .getUrl(Uri.parse("http://81.68.216.118:9094/api/get/timeon/2"));
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

  // void testFuture() {
  //   Future future = new Future(() => null);
  //   future.then((_) {
  //     gettime();
  //   }).then((_) {
  //     setState(() {});
  //   }).catchError((_) {
  //     print("catchError");
  //   });
  // }

  void initState() {
    // super.initState();
    // Future.delayed(
    //     Duration.(),
    //     () => setState(() {
    //           gettime();
    //         }));
    gettime();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // testFuture();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 83, 63, 63), size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "设置周四时间",
          style: TextStyle(
            color: Colors.blue,
            fontFamily: "STKaiti",
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (() {
              // posttime();
            }),
            icon: Icon(
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
                            width: 350,
                            height: 30,
                            child: Text(
                              "时间段${count}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  if (count == _count) {
                                    _sliderValue01.remove(_count);
                                    _sliderValue02.remove(_count);
                                    _sliderValue03.remove(_count);
                                    _sliderValue04.remove(_count);
                                    _count--;
                                    // print("${this._count}");
                                    // }
                                  } else {
                                    for (int i = count; i < _count; ++i) {
                                      _sliderValue01[i] = _sliderValue01[i + 1];
                                      _sliderValue02[i] = _sliderValue02[i + 1];
                                      _sliderValue03[i] = _sliderValue03[i + 1];
                                      _sliderValue04[i] = _sliderValue04[i + 1];
                                    }
                                    _sliderValue01.remove(_count);
                                    _sliderValue02.remove(_count);
                                    _sliderValue03.remove(_count);
                                    _sliderValue04.remove(_count);
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
                          Text("    设置开始小时:    "),
                          Slider(
                              value: _sliderValue01[count],
                              onChanged: (data) {
                                // print('change:$data');
                                setState(() {
                                  _sliderValue01[count] = data;
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
                              label: '${_sliderValue01[count].toInt()}',
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars}';
                              }),
                          Text("设为:  ${_sliderValue01[count].toInt()}"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Text("    设置开始分钟:    "),
                          Slider(
                              value: _sliderValue02[count],
                              onChanged: (data) {
                                // print('change:$data');
                                setState(() {
                                  _sliderValue02[count] = data;
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
                              label: '${_sliderValue02[count].toInt()}',
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars}';
                              }),
                          Text("设为:  ${_sliderValue02[count].toInt()}"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("    设置结束小时:    "),
                          Slider(
                              value: _sliderValue03[count],
                              onChanged: (data) {
                                // print('change:$data');
                                setState(() {
                                  _sliderValue03[count] = data;
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
                              label: '${_sliderValue03[count].toInt()}',
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars}';
                              }),
                          Text("设为:  ${_sliderValue03[count + 1].toInt()}"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("    设置结束分钟:    "),
                          Slider(
                              value: _sliderValue04[count],
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
                              label: '${_sliderValue04[count].toInt()}',
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars}';
                              }),
                          Text("设为:  ${_sliderValue04[count].toInt()}"),
                        ],
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _count++;
              _sliderValue01.add(0);
              _sliderValue02.add(0);
              _sliderValue03.add(0);
              _sliderValue04.add(0);
            });
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

