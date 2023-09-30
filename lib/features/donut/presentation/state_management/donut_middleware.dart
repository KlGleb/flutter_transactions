import 'package:redux/redux.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_actions.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_state.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_actions.dart';

List<Middleware<AppState>> createDonutMiddleware(TransactionRepository repository) => [
      TypedMiddleware<AppState, TransactionsUpdated>(_createDonut()),
    ];

Middleware<AppState> _createDonut() => (Store<AppState> store, action, NextDispatcher next) {
      next(action);

      final DonutState map = {};
      for (final element in action.transactions) {
        if (map.containsKey(element.type)) {
          map[element.type] = map[element.type]! + 1;
        } else {
          map[element.type] = 1;
        }
      }

      store.dispatch(DonutUpdated(map));
    };
