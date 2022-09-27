import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConvertCurrencyPage extends StatefulWidget {
  const ConvertCurrencyPage({Key? key}) : super(key: key);

  @override
  State<ConvertCurrencyPage> createState() => _ConvertCurrencyPageState();
}

class _ConvertCurrencyPageState extends State<ConvertCurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('ConvertCurrency'),
    );
  }
}
