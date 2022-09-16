import 'package:flutter/foundation.dart';
import 'package:lab5/models/tranasaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: "กางเกง", amount: 500, date: DateTime.now()),
    Transaction(title: "เสื้อยืด", amount: 300, date: DateTime.now()),
    Transaction(title: "เชิ้ต", amount: 600, date: DateTime.now()),
  ];

  List<Transaction> getTransaction() {
    return transactions;
  }

  addTransaction(Transaction statement) {
    transactions.add(statement);
  }
}
