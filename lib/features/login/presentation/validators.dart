part of 'login_screen.dart';

FormFieldValidator<String> _userNameValidator(BuildContext context) => (value) {
      if (value == null || value.isEmpty) {
        return context.lang.userNameValidationError;
      }
      return null;
    };

FormFieldValidator<String> _passwordValidator(BuildContext context) => (value) {
      if (value == null || value.isEmpty) {
        return context.lang.passwordValidationError;
      }
      return null;
    };
