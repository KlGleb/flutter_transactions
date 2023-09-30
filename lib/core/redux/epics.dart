import 'dart:async';

import 'package:logger/logger.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';

final _logger = getIt<Logger>();
final EpicMiddleware<AppState> epicMiddleware = EpicMiddleware(epic);

final epic = combineEpics<AppState>([
  SubscribeTransactionsEpic(getIt()),
  SubscribeTransactionEpic(getIt()),
  SubscribeCountEpic(getIt()),
]);

class SubscribeTransactionsEpic implements EpicClass<AppState> {
  final TransactionRepository _repository;

  SubscribeTransactionsEpic(this._repository);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<SubscribeToTransactions>().switchMap(
          (value) => _repository.transactions
              .map((event) => TransactionsUpdated(event))
              .takeUntil(actions.whereType<UnsubscribeFromTransactions>()),
        );
  }
}

class SubscribeTransactionEpic implements EpicClass<AppState> {
  final TransactionRepository _repository;

  SubscribeTransactionEpic(this._repository);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<SubscribeToTransaction>().switchMap((value) => _repository
        .watchById(value.transactionId)
        .map((event) => TransactionDetailsUpdated(event))
        .takeUntil(actions.whereType<UnsubscribeFromTransaction>())
        .doOnListen(() => _logger.w('listened'))
        .doOnDone(() => _logger.w('done'))
        .doOnCancel(() => _logger.w('canceled')));
  }
}

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
