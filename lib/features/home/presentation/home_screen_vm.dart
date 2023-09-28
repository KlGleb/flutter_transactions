import 'package:redux/redux.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';

class HomeViewModel {
  final Store<AppState> _store;

  HomeViewModel(this._store);

  void onLogOut() => _store.dispatch(Logout());
}