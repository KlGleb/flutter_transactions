part of 'transactions_screen.dart';

class _MyShimmer extends StatelessWidget {
  const _MyShimmer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.2);
    final highlightColor = Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.2);

    return Shimmer.fromColors(baseColor: baseColor, highlightColor: highlightColor, child: child);
  }
}

class _TransactionCardShimmer extends StatelessWidget {
  const _TransactionCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _MyShimmer(
      child: IgnorePointer(
        child: _TransactionCard(
          transaction: TransactionModel(
            id: '###',
            amount: 123,
            commission: 0,
            total: 0,
            type: TransactionType.transfer,
            date: DateTime.now(),
          ),
        ),
      ),
    );
  }
}
