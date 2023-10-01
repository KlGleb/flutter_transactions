import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/util/lang.dart';
import 'package:transactions/features/login/presentation/state_management/login_actions.dart';

part 'error_field.dart';

part 'login_screen_vm.dart';

part 'validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const decoration = InputDecoration(border: OutlineInputBorder());

    return Scaffold(
      appBar: AppBar(title: Text(context.lang.loginTitle)),
      body: StoreConnector<AppState, _LoginScreenViewModel>(
        rebuildOnChange: false,
        converter: (store) => _LoginScreenViewModel(store),
        builder: (context, vm) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: 'user',
                  decoration: decoration.copyWith(labelText: context.lang.userNameLabel),
                  onSaved: (newValue) => vm.onSaveUserName(newValue!),
                  validator: _userNameValidator(context),
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.username],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  initialValue: 'password',
                  decoration: decoration.copyWith(labelText: context.lang.passwordLabel),
                  obscureText: true,
                  validator: _passwordValidator(context),
                  onSaved: (newValue) => vm.onSavePassword(newValue!),
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.password],
                ),
                const SizedBox(height: 16.0),
                const _ErrorField(),
                const SizedBox(height: 32.0),
                StoreConnector<AppState, bool>(
                  converter: (store) => store.state.loginState.inProgress,
                  distinct: true,
                  builder: (BuildContext context, inProgress) => ElevatedButton(
                    onPressed: inProgress
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              vm.onLogin();
                            }
                          },
                    child: Text(context.lang.loginButton),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
