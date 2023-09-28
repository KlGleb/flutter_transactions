import 'package:redux/redux.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';

class LoginScreenViewModel {
  final Store<AppState> _store;

  LoginScreenViewModel(this._store);

  void onLogin(String userName, String password) => _store.dispatch(Login('userName', 'password'));
}
