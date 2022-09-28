import 'package:atv_flutter_03/application/contracts/currency_repository.dart';
import 'package:flutter/material.dart';

class CurrenciesPage extends StatefulWidget {
  final CurrencyRepository currencyRepository;

  const CurrenciesPage({
    Key? key,
    required this.currencyRepository,
  }) : super(key: key);

  @override
  State<CurrenciesPage> createState() => _CurrenciesPageState();
}

class _CurrenciesPageState extends State<CurrenciesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Currencies'),
    );
  }
}
