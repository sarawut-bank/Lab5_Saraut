import 'package:flutter/foundation.dart';
import 'package:lab5/models/tranasaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [];

  List<Transaction> getTransaction() {
    return transactions;
  }

  addTransaction(Transaction statement) {
    transactions.insert(0, statement);

    notifyListeners();
  }
}
