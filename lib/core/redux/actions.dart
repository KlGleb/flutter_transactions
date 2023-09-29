import 'package:transactions/core/domain/models/transaction_model.dart';
import 'package:transactions/core/redux/app_state.dart';

sealed class AuthAction {}

class Login extends AuthAction {
  final String userName;
  final String password;

  Login(this.userName, this.password);
}

class Logout extends AuthAction {}

class LoginSuccess extends AuthAction {}

class LogoutSuccess extends AuthAction {}

sealed class TransactionAction {}

class TransactionsUpdated extends TransactionAction {
  Iterable<TransactionModel> transactions;

  TransactionsUpdated(this.transactions);
}

class TransactionsCountUpdated extends TransactionAction {
  int count;

  TransactionsCountUpdated(this.count);
}

class GetTransactions extends TransactionAction {}

sealed class TransactionDetailsAction {}

class TransactionDetailsUpdated extends TransactionDetailsAction {
  TransactionModel? transaction;

  TransactionDetailsUpdated(this.transaction);

  TransactionDetailsUpdated.clear();
}

sealed class DonutAction {}

class DonutUpdated {
  DonutState data;

  DonutUpdated(this.data);
}
