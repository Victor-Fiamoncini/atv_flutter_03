import 'package:atv_flutter_03/application/contracts/currency_repository.dart';
import 'package:flutter/material.dart';

class CurrenciesHistoryPage extends StatelessWidget {
  final CurrencyRepository currencyRepository;

  const CurrenciesHistoryPage({
    Key? key,
    required this.currencyRepository,
  }) : super(key: key);

  void _onBackButtonPress(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        title: Text(
          'Histórico de Conversões',
          style: TextStyle(
            color: theme.colorScheme.secondary,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: BackButton(
          color: theme.colorScheme.secondary,
          onPressed: () => _onBackButtonPress(context),
        ),
      ),
      body: Text('Currencies'),
    );
  }
}
