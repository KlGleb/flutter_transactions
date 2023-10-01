part of 'home_screen.dart';

class _TransactionsScope extends StatelessWidget {
  const _TransactionsScope({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => StoreBuilder<AppState>(
        onInit: (store) {
          store.dispatch(SubscribeToTransactions());
          store.dispatch(SyncTransactions());
        },
        onDispose: (store) => store.dispatch(UnsubscribeFromTransactions()),
        rebuildOnChange: false,
        builder: (_, __) => child,
      );
}
