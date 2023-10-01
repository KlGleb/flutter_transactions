import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:transactions/features/donut/presentation/donut_screen.dart';
import 'package:transactions/features/home/presentation/home_screen.dart';
import 'package:transactions/features/login/presentation/login_screen.dart';
import 'package:transactions/features/transaction_details/presentation/transaction_details_screen.dart';
import 'package:transactions/features/transactions/presentation/transactions_screen.dart';

final routes = RouteMap(
  onUnknownRoute: (_) => const Redirect('/'),
  routes: {
    '/': (_) => const TabPage(
          child: HomeScreen(),
          paths: ['/transactions', '/donut'],
        ),
    '/transactions': (_) => const MaterialPage(child: TransactionsScreen()),
    '/donut': (_) => const MaterialPage(child: DonutScreen()),
    '/transaction/:id': (info) => MaterialPage(child: TransactionDetailsScreen(id: info.pathParameters['id']!)),
  },
);

final unauthorisedRoutes = RouteMap(
  onUnknownRoute: (_) => const Redirect('/login'),
  routes: {
    '/login': (_) => MaterialPage(child: LoginScreen()),
  },
);
