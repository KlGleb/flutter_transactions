part of 'login_screen.dart';

class _ErrorField extends StatelessWidget {
  const _ErrorField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error);
    const duration = Duration(milliseconds: 200);

    return Column(
      children: [
        StoreConnector<AppState, bool>(
          converter: (store) => store.state.loginState.wrongCredentialsError,
          distinct: true,
          builder: (context, vm) => AnimatedOpacity(
            opacity: vm ? 1 : 0,
            duration: duration,
            child: Text(context.lang.wrongCredentialsError, style: textStyle),
          ),
        ),
        StoreConnector<AppState, bool>(
          converter: (store) => store.state.loginState.unknownError,
          distinct: true,
          builder: (context, vm) => AnimatedOpacity(
            opacity: vm ? 1 : 0,
            duration: duration,
            child: Text(context.lang.unknownError, style: textStyle),
          ),
        ),
      ],
    );
  }
}
