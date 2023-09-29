part of 'transaction_details_screen.dart';

class _TransactionDetailsCard extends StatelessWidget {
  const _TransactionDetailsCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(transaction.date.toString()),
        Text(transaction.sum.toString()),
        Text(transaction.commission.toString()),
        const Text('todo: итого'),
        Text(transaction.type.toString()),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Cancel transaction'),
        ),
      ],
    );
  }
}
