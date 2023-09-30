import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/util/lang.dart';
import 'package:transactions/features/login/presentation/login_screen.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_actions.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_state.dart';
import 'package:transactions/features/transactions/presentation/transactions_screen.dart';

part 'transaction_details_card.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(context.lang.transactionDetailsTitle(id))),
        body: StoreConnector<AppState, TransactionDetailsState>(
          converter: (store) => store.state.transactionDetailsState,
          onInit: (store) => store.dispatch(SubscribeToTransaction(id)),
          onDispose: (store) => store.dispatch(UnsubscribeFromTransaction()),
          onDidChange: (previousViewModel, viewModel) {
            if (viewModel.removingDone) {
              Routemaster.of(context).pop();
            }
          },
          builder: (context, dynamic vm) {
            final tr = vm.transaction;
            if (tr == null) return const Center(child: CircularProgressIndicator());
            return _TransactionDetailsCard(transaction: tr, cancelDisabled: vm.removingInProgress);
          },
        ),
      );
}
