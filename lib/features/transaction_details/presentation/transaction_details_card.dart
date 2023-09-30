part of 'transaction_details_screen.dart';

class _TransactionDetailsCard extends StatelessWidget {
  const _TransactionDetailsCard({
    Key? key,
    required this.transaction,
    required this.cancelDisabled,
  }) : super(key: key);

  final TransactionModel transaction;
  final bool cancelDisabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Text(
                context.lang.moneyAmount(transaction.amount),
                style: theme.textTheme.headlineLarge!.copyWith(color: theme.colorScheme.primary),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                TransactionIcon(type: transaction.type),
                const SizedBox(width: 8),
                Text(transaction.type.getName(context)),
              ],
            ),
          ],
        ),
        ListTile(
          leading: const Icon(Icons.timer_outlined),
          title: Text(DateFormat.yMMM().add_jm().format(transaction.date)),
        ),
        ListTile(
          leading: const Icon(Icons.price_check_outlined),
          title: Text(context.lang.moneyAmount(transaction.commission)),
          subtitle: Text(context.lang.commissionLabel),
        ),
        ListTile(
          leading: const Icon(Icons.summarize_outlined),
          title: Text(context.lang.moneyAmount(transaction.total)),
          subtitle: Text(context.lang.totalAmountLabel),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: cancelDisabled
                ? null
                : () => StoreProvider.of<AppState>(context).dispatch(RemoveTransaction(transaction.id)),
            child: Text(context.lang.cancelTransactionButton),
          ),
        ),
      ],
    );
  }
}
