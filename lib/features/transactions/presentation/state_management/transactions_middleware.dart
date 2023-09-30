import 'package:redux/redux.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_actions.dart';

List<Middleware<AppState>> createTransactionsMiddleware(TransactionRepository repository) => [
      TypedMiddleware<AppState, GetTransactions>(_createGetTransactions(repository)),
    ];

Middleware<AppState> _createGetTransactions(TransactionRepository repository) =>
    (Store<AppState> store, action, NextDispatcher next) {
      next(action);
      repository.sync();
    };
