import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/core/domain/auth_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/middlewares.dart';
import 'package:transactions/core/redux/reducers.dart';
import 'package:transactions/core/router/router.dart';

void main() {
  initDependencies();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: getIt<Store<AppState>>(),
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, vm) =>
            MaterialApp.router(
              routerDelegate: RoutemasterDelegate(
                routesBuilder: (context) => vm.authState is Unauthorized ? unauthorisedRoutes : routes,
              ),
              routeInformationParser: const RoutemasterParser(),
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
            ),
      ),
    );
  }
}
