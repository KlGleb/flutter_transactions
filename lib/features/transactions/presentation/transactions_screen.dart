import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  List.generate(50, (index) => ListTile(
          title: Text('Transaction $index'),
          onTap: () {
            context.go('/$index');
          },
        )),
      ),
    );
  }
}
