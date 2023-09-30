import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:transactions/core/domain/transaction_repository.dart';
import 'package:transactions/core/redux/app_state.dart';
import 'package:transactions/features/transaction_details/presentation/state_management/transaction_details_actions.dart';

class SubscribeTransactionEpic implements EpicClass<AppState> {
  final TransactionRepository _repository;

  SubscribeTransactionEpic(this._repository);

  @override
  Stream<dynamic> call(Stream<dynamic> actions, EpicStore<AppState> store) =>
      actions.whereType<SubscribeToTransaction>().switchMap(
            (value) => _repository
                .watchById(value.transactionId)
                .map((event) => TransactionDetailsUpdated(event))
                .takeUntil(actions.whereType<UnsubscribeFromTransaction>()),
          );
}
