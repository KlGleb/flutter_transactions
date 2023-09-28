import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/transactions/presentation/transactions_screen_vm.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TransactionsScreenViewModel>(
      converter: (store) => TransactionsScreenViewModel(store),
      builder: (context, vm) =>
          ListView(
            children: List.generate(
              50,
                  (index) =>
                  ListTile(
                    title: Text('Transaction $index'),
                    onTap: () => Routemaster.of(context).push('/transaction/$index'),
                  ),
            ),
          ),
    );
  }
}
