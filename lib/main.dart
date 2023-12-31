import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/core/redux/auth/auth_state.dart';
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
      child: StoreConnector<AppState, AuthState>(
        converter: (store) => store.state.authState,
        distinct: true,
        builder: (context, authState) => MaterialApp.router(
          routerDelegate: RoutemasterDelegate(
            routesBuilder: (context) => authState == AuthState.authorized ? routes : unauthorisedRoutes,
          ),
          routeInformationParser: const RoutemasterParser(),
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
          ],
        ),
      ),
    );
  }
}
