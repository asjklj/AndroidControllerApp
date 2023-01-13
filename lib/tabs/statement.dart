import 'package:flutter/material.dart';

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  var _selectedValue = 1;
  var _selectedIndex = 0;

  @override
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
            decoration: const BoxDecoration(
              color: Colors.blue,
              boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 20.0)],
              gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("偏好 :"),
              DropdownButton(
                value: _selectedValue,
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
                  _selectedValue = value!;
                  setState(() {});
                },
              )
            ])),
        Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.blue,
              boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 20.0)],
              gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("模式 :"),
              DropdownButton(
                value: _selectedValue,
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
                  _selectedValue = value!;
                  setState(() {});
                },
              )
            ])),
        Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.blue,
              boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 20.0)],
              gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("风速 :"),
              DropdownButton(
                value: _selectedValue,
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
                  _selectedValue = value!;
                  setState(() {});
                },
              )
            ])),
        Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.blue,
              boxShadow: [BoxShadow(color: Colors.lightBlue, blurRadius: 20.0)],
              gradient: LinearGradient(colors: [Colors.blue, Colors.white]),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("温度 :"),
              DropdownButton(
                value: _selectedValue,
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text("24"),
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
                  _selectedValue = value!;
                  setState(() {});
                },
              )
            ])
            ),
      ],
    );
  }
}
void GetStatement(index) {}
void PostStatement(index) {}
