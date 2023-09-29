import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transactions/core/domain/models/transaction_type.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/util/lang.dart';
import 'package:transactions/features/login/presentation/login_screen_vm.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.lang.loginTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(labelText: context.lang.userNameLabel)),
            const SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: context.lang.passwordLabel),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            StoreConnector<AppState, LoginScreenViewModel>(
              converter: (store) => LoginScreenViewModel(store),
              builder: (BuildContext context, vm) {
                return ElevatedButton(
                  onPressed: () => vm.onLogin('userName', 'password'),
                  child: Text(context.lang.loginButton),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension TransactionTypeName on TransactionType {
  String getName(BuildContext context) {
    switch (this) {
      case TransactionType.deposit:
        return context.lang.transactionTypeDeposit;
      case TransactionType.transfer:
        return context.lang.transactionTypeTransfer;
      case TransactionType.withdrawal:
        return context.lang.transactionTypeWithdrawal;
    }
  }
}