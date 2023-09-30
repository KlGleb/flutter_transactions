import 'package:transactions/core/di/init_dependencies.dart';
import 'package:transactions/features/donut/presentation/state_management/donut_middleware.dart';
import 'package:transactions/features/login/presentation/state_management/login_middleware.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_middleware.dart';
import 'package:transactions/features/transactions/presentation/state_management/transactions_middleware.dart';

final appMiddleware = [
  ...createAuthMiddleware(getIt()),
  ...createTransactionsMiddleware(getIt()),
  ...createTransactionDetailsMiddleware(getIt()),
  ...createDonutMiddleware(getIt()),
];
