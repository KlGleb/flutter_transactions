import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/util/lang.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_state.dart';

part 'transaction_card.dart';
part 'transaction_card_shimmer.dart';
part 'transaction_icon.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, TransactionsState>(
        converter: (Store<AppState> store) => store.state.transactionsState,
        distinct: true,
        builder: (context, vm) => vm.synchronizing
            ? const _TransactionsListShimmer()
            : ListView.builder(
                itemBuilder: (context, index) =>
                    _TransactionCard(key: ValueKey(vm.transactions[index]), transaction: vm.transactions[index]),
                itemCount: vm.transactions.length,
              ),
      );
}

class _TransactionsListShimmer extends StatelessWidget {
  const _TransactionsListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (context, index) => const _TransactionCard.shimmer(),
        itemCount: 20,
      );
}
