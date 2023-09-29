import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/login/presentation/login_screen_vm.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(decoration: InputDecoration(labelText: 'User name')),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            StoreConnector<AppState, LoginScreenViewModel>(
              converter: (store) => LoginScreenViewModel(store),
              builder: (BuildContext context, vm) {
                return ElevatedButton(
                  onPressed: () => vm.onLogin('userName', 'password'),
                  child: const Text('Log in'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
