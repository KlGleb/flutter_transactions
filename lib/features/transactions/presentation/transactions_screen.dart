import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/widgets/state_stream_builder.dart';

part 'transaction_icon.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TransactionsState>(
      converter: (store) => store.state.transactionsState,
      builder: (context, vm) => StreamableStoreBuilder<Iterable<TransactionModel>>(
        stream: getIt<TransactionRepository>().transactions,
        actionBuilder: (event) => TransactionsUpdated(event),
        initAction: GetTransactions(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final tr = vm.transactions[index];
            return ListTile(
              title: Text('${tr.sum} \$'),
              subtitle: Text('#${tr.id}'),
              trailing: _TransactionIcon(type: tr.type),
              onTap: () => Routemaster.of(context).push('/transaction/${tr.id}'),
            );
          },
          itemCount: vm.transactions.length,
        ),
      ),
    );
  }
}
