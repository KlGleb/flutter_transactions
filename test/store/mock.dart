import 'package:mockito/annotations.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/domain/auth_repository.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/app_state.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepository>(),
  MockSpec<TransactionRepository>(),
  MockSpec<Store<AppState>>(),
])
export 'mock.mocks.dart';

class TestNextDispatcher {
  var called = false;

  void nextDispatcher(action) {
    called = true;
  }
}
