part of 'transactions_screen.dart';

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({
    Key? key,
    required TransactionModel this.transaction,
  }) : super(key: key);

  const _TransactionCard.shimmer() : transaction = null;

  final TransactionModel? transaction;

  @override
  Widget build(BuildContext context) {
    final tr = transaction;

    return tr == null
        ? const _TransactionCardShimmer()
        : ListTile(
            title: Text(
              context.lang.moneyAmount(tr.amount),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(context.lang.transactionId(tr.id)),
            leading: TransactionIcon(type: tr.type),
            onTap: () => Routemaster.of(context).push('/transaction/${tr.id}'),
          );
  }
}
