import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/home/presentation/home_screen_vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);

    return StoreConnector<AppState, HomeViewModel>(
      converter: (store) => HomeViewModel(store),
      builder: (context, vm) =>
          Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              bottom: TabBar(
                controller: tabPage.controller,
                tabs: const [
                  Tab(text: 'Transactions'),
                  Tab(text: 'Donut'),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () => vm.onLogOut(),
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
