import 'package:flutter/material.dart';
class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       const Center(child: Text("查看及修改当前空调状态",style: TextStyle(fontSize: 20, color: Colors.red))),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ElevatedButton(onPressed: (){}, child: const Text("提交"))],)
    ],);
  }
}