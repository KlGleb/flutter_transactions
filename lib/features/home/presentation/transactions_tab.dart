part of 'home_screen.dart';

class _TransactionsTab extends StatelessWidget {
  const _TransactionsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      onInit: (store) => store.dispatch(SubscribeToCount()),
      onDispose: (store) => store.dispatch(UnsubscribeFromCount()),
      converter: (store) => store.state.transactionsState.count,
      builder: (context, count) => Tab(text: context.lang.tabTransactions(count)),
    );
  }
}
