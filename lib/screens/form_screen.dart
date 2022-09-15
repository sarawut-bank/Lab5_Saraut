import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("แบบฟอร์มบันทึกข้อมูล")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                  autofocus: true,
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                ),
                ElevatedButton(
                  child: Text("เพิ่มข้อมูล"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
