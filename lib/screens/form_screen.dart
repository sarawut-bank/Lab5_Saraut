import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lab5/models/tranasaction.dart';
import 'package:lab5/provider/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final formkey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("แบบฟอร์มบันทึกข้อมูล")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                  autofocus: true,
                  controller: titleController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "กรุณาป้อนชื่อรายการ!";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return "กรุณาป้อนชื่อจำนวนเงิน!";
                    }
                    if (double.parse(str) <= 0) {
                      return "กรุณาป้อนตัวเลขมากกว่า 0 !";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: Text("เพิ่มข้อมูล"),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      var title = titleController.text;
                      var amount = amountController.text;

                      Transaction statement = Transaction(
                          title: title,
                          amount: double.parse(amount),
                          date: DateTime.now());

                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);

                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
