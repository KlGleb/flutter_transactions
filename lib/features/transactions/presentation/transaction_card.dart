part of 'transactions_screen.dart';

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          context.lang.moneyAmount(transaction.amount),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(context.lang.transactionId(transaction.id)),
        leading: TransactionIcon(type: transaction.type),
        onTap: () => Routemaster.of(context).push('/transaction/${transaction.id}'),
      );
}
