import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/util/lang.dart';
import 'package:transactions/features/home/presentation/state_management/home_actions.dart';
import 'package:transactions/features/login/presentation/state_management/login_actions.dart';

part 'transactions_scope.dart';

part 'transactions_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);

    return _TransactionsScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.lang.homeTitle),
          bottom: TabBar(
            controller: tabPage.controller,
            tabs: [
              const _TransactionsTab(),
              Tab(text: context.lang.tabChart),
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
