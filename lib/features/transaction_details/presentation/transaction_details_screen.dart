import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/util/lang.dart';
import 'package:transactions/core/widgets/state_stream_builder.dart';
import 'package:transactions/features/login/presentation/login_screen.dart';
import 'package:transactions/features/transactions/presentation/transactions_screen.dart';

part 'transaction_details_card.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaction $id')),
      body: StoreConnector<AppState, TransactionDetailsState>(
        converter: (store) => store.state.transactionDetailsState,
        builder: (context, vm) => StreamableStoreBuilder(
          stream: getIt<TransactionRepository>().watchById(id),
          actionBuilder: (event) => TransactionDetailsUpdated(event),
          initAction: TransactionDetailsUpdated.clear(),
          child: Builder(
            builder: (context) {
              final tr = vm.transaction;
              if (tr == null) return const Center(child: CircularProgressIndicator());
              return _TransactionDetailsCard(transaction: tr);
            },
          ),
        ),
      ),
    );
  }
}
