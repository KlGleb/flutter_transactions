import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_actions.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_reducers.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_state.dart';

void main() {
  late Reducer<DonutState> reducer;

  setUp(() => reducer = donutReducer);

  group('donutReducer tests', () {
    test('DonutUpdated action should make action.data state', () {
      expect(reducer({}, DonutUpdated({TransactionType.deposit: 15})), {TransactionType.deposit: 15});
    });
  });
}
