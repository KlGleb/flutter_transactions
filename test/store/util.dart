import 'package:redux/redux.dart';
import 'package:transactions/core/redux/app_state.dart';

extension MiddleWareExt on List<Middleware<AppState>> {
  void act(Store<AppState> store, dynamic action, NextDispatcher next) =>
      forEach((element) => element.call(store, action, next));
}
