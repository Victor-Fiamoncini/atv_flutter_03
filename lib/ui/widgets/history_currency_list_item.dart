import 'package:atv_flutter_03/application/entities/history_currency_entity.dart';
import 'package:flutter/material.dart';

class HistoryCurrencyListItem extends StatelessWidget {
  final HistoryCurrencyEntity historyCurrency;

  const HistoryCurrencyListItem({super.key, required this.historyCurrency});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final fromConversionType =
        historyCurrency.fromConversionType.name.toUpperCase();
    final toConversionType =
        historyCurrency.toConversionType.name.toUpperCase();
    final fromValue = historyCurrency.fromValue;
    final toValue = historyCurrency.toValue;

    return Card(
      margin: const EdgeInsets.only(top: 16),
      elevation: 0,
      color: theme.colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 12,
        ),
        title: Text(
          '${historyCurrency.user.name} - ${historyCurrency.user.email}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.secondary,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(
              'De $fromConversionType: $fromValue',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Para $toConversionType: $toValue',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
