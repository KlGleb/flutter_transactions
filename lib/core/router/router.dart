import 'package:go_router/go_router.dart';
import 'package:transactions/features/transaction_details/presentation/transaction_details_screen.dart';
import 'package:transactions/features/transactions/presentation/transactions_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TransactionsScreen(),
      routes: [
        GoRoute(
          path: ':transactionId',
          builder: (context, state) => TransactionDetailsScreen(id: state.pathParameters['transactionId']!),
        ),
      ],
    ),
  ],
  debugLogDiagnostics: true,
);
