part of 'transactions_screen.dart';

class _TransactionIcon extends StatelessWidget {
  const _TransactionIcon({Key? key, required this.type}) : super(key: key);

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    final String semanticLabel;
    switch (type) {
      case TransactionType.deposit:
        icon = Icons.arrow_upward_outlined;
        semanticLabel = 'deposit';
      case TransactionType.transfer:
        icon = Icons.arrow_forward_outlined;
        semanticLabel = 'transfer';
      case TransactionType.withdrawal:
        icon = Icons.arrow_downward_outlined;
        semanticLabel = 'withdrawal';
    }

    return Icon(icon, semanticLabel: semanticLabel);
  }
}
