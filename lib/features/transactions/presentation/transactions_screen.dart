import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/util/lang.dart';

part 'transaction_card.dart';
part 'transaction_icon.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, TransactionsState>(
        converter: (Store<AppState> store) => store.state.transactionsState,
        onInit: (store) => _getTransactions(store),
        builder: (context, dynamic vm) => ListView.builder(
          itemBuilder: (context, index) => _TransactionCard(transaction: vm.transactions[index]),
          itemCount: vm.transactions.length,
        ),
      );

  void _getTransactions(Store<AppState> store) => store.dispatch(GetTransactions());
}
