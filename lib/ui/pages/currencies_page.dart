import 'package:flutter/material.dart';

class CurrenciesPage extends StatefulWidget {
  const CurrenciesPage({Key? key}) : super(key: key);

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
