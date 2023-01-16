// ignore: file_names
import 'dart:developer';

import 'package:flutter/material.dart';

class SundayPage extends StatefulWidget {
  const SundayPage({super.key});

  @override
  State<SundayPage> createState() => _SundayPageState();
}

class _SundayPageState extends State<SundayPage> {
  int _count = 0;
  List<double> _sliderValue01 = [0];
  List<double> _sliderValue02 = [0];
  List<double> _sliderValue03 = [0];
  List<double> _sliderValue04 = [0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("set Sunday time"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _count,
                itemBuilder: (context, _count) {
                  // return ListTile(
                  //   title: Text("time$_count"),
                  //   trailing: const Icon(Icons.keyboard_arrow_right),
                  //   onTap: () {
                  //     // do something
                  //   },
                  // );
                  return Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Text("time$_count start hour:    "),
                          Slider(
                              value: _sliderValue01[_count],
                              onChanged: (data) {
                                // print('change:$data');
                                setState(() {
                                  _sliderValue01[_count] = data;
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
                              label: '${_sliderValue01[_count].toInt()}',
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars}';
                              }),
                          Text("set to:  ${_sliderValue01[_count].toInt()}"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("time$_count start minute:"),
                          Slider(
                              value: _sliderValue02[_count],
                              onChanged: (data) {
                                // print('change:$data');
                                setState(() {
                                  _sliderValue02[_count] = data;
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
                              label: '${_sliderValue02[_count].toInt()}',
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars}';
                              }),
                          Text("set to:  ${_sliderValue02[_count].toInt()}"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("time$_count end hour:       "),
                          Slider(
                              value: _sliderValue03[_count],
                              onChanged: (data) {
                                // print('change:$data');
                                setState(() {
                                  _sliderValue03[_count] = data;
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
                              label: '${_sliderValue03[_count].toInt()}',
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars}';
                              }),
                          Text("set to:  ${_sliderValue03[_count].toInt()}"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("time$_count end minute:   "),
                          Slider(
                              value: _sliderValue04[_count],
                              onChanged: (data) {
                                // print('change:$data');
                                setState(() {
                                  _sliderValue04[_count] = data;
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
                              label: '${_sliderValue04[_count].toInt()}',
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              semanticFormatterCallback: (double newValue) {
                                return '${newValue.round()} dollars}';
                              }),
                          Text("set to:  ${_sliderValue04[_count].toInt()}"),
                        ],
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
      // bottomNavigationBar:
      //     BottomNavigationBar(fixedColor: Colors.amber, floatingA),
      // ignore: prefer_const_constructors
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
}
