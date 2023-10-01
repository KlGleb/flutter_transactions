part of 'login_screen.dart';

class _LoginScreenViewModel {
  final Store<AppState> _store;

  _LoginScreenViewModel(this._store);

  void onSaveUserName(String userName) => _store.dispatch(SaveUserName(userName));

  void onSavePassword(String password) => _store.dispatch(SavePassword(password));

  void onLogin() => _store.dispatch(Login());
}
