import 'package:redux/redux.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_actions.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_state.dart';

Reducer<DonutState> donutReducer = combineReducers([
  TypedReducer<DonutState, DonutUpdated>(_donutUpdated),
]);

DonutState _donutUpdated(DonutState state, DonutUpdated action) => action.data;
