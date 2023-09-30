import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transactions/core/domain/models/transaction_model.dart';

part 'transactions_state.freezed.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    @Default([]) List<TransactionModel> transactions,
    @Default(0) int count,
  }) = _TransactionsState;
}
