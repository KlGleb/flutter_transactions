import 'package:redux/redux.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_actions.dart';

List<Middleware<AppState>> createTransactionDetailsMiddleware(TransactionRepository repository) => [
      TypedMiddleware<AppState, RemoveTransaction>(_createRemoveTransactions(repository)),
    ];

Middleware<AppState> _createRemoveTransactions(TransactionRepository repository) =>
    (Store<AppState> store, action, NextDispatcher next) {
      next(action);
      repository.remove(action.id).then((value) => store.dispatch(RemoveCompleted()));
    };
