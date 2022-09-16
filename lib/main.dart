import 'package:flutter/material.dart';
import 'package:lab5/models/tranasaction.dart';
import 'package:lab5/provider/transaction_provider.dart';
import 'package:lab5/screens/form_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'แอพบัญชี'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormScreen();
                }));
              },
            )
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, child) {
            return ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, int index) {
                  Transaction data = provider.transactions[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: FittedBox(
                            child: Text(data.amount.toString()),
                          )),
                      title: Text(data.title.toString()),
                      subtitle: Text(data.date.toString()),
                    ),
                  );
                });
          },
        ));
  }
}
