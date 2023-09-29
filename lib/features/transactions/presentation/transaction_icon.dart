part of 'transactions_screen.dart';

class TransactionIcon extends StatelessWidget {
  const TransactionIcon({Key? key, required this.type}) : super(key: key);

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    final Color color;
    switch (type) {
      case TransactionType.deposit:
        color = Theme.of(context).colorScheme.primary;
        icon = Icons.arrow_upward_outlined;
      case TransactionType.transfer:
        color = Theme.of(context).colorScheme.secondary;
        icon = Icons.swap_horiz_outlined;
      case TransactionType.withdrawal:
        color = Theme.of(context).colorScheme.tertiary;
        icon = Icons.arrow_downward_outlined;
    }

    return Icon(icon, color: color);
  }
}
