import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/actions.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/widgets/state_stream_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);

    return StoreConnector<AppState, TransactionsState>(
      converter: (store) => store.state.transactionsState,
      builder: (context, vm) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          bottom: TabBar(
            controller: tabPage.controller,
            tabs: [
              StreamableStoreBuilder<int>(
                stream: getIt<TransactionRepository>().count,
                actionBuilder: (event) => TransactionsCountUpdated(event),
                child: Tab(text: 'Transactions (${vm.count})'),
              ),
              const Tab(text: 'Donut'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => StoreProvider.of<AppState>(context).dispatch(Logout()),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: TabBarView(
          controller: tabPage.controller,
          children: [
            for (final stack in tabPage.stacks) PageStackNavigator(stack: stack),
          ],
        ),
      ),
    );
  }
}
