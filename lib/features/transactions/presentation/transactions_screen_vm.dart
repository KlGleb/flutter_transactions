import 'package:redux/redux.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/reducers.dart';

class TransactionsScreenViewModel {
  final Store<AppState> _store;

  TransactionsScreenViewModel(this._store);
}