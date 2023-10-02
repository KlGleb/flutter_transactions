import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/home/presentation/state_management/home_actions.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_actions.dart';

class SubscribeCountEpic implements EpicClass<AppState> {
  final TransactionRepository _repository;

  SubscribeCountEpic(this._repository);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) =>
      actions.whereType<SubscribeToCount>().switchMap(
            (value) => _repository.count
                .map((event) => TransactionsCountUpdated(event))
                .takeUntil(actions.whereType<UnsubscribeFromCount>()),
          );
}

class SubscribeTransactionsEpic implements EpicClass<AppState> {
  final TransactionRepository _repository;

  SubscribeTransactionsEpic(this._repository);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) =>
      actions.whereType<SubscribeToTransactions>().switchMap(
            (value) => _repository.transactions
                .map((event) => TransactionsUpdated(event))
                .takeUntil(actions.whereType<UnsubscribeFromTransactions>()),
          );
}
