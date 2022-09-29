import 'package:atv_flutter_03/application/contracts/currency_repository.dart';
import 'package:atv_flutter_03/application/entities/currency_entity.dart';
import 'package:flutter/material.dart';

class ConvertCurrencyPageController {
  CurrencyEntity? fromCurrency;
  CurrencyEntity? toCurrency;

  final TextEditingController fromTextEditingController;
  final TextEditingController toTextEditingController;
  final CurrencyRepository currencyRepository;

  ConvertCurrencyPageController({
    required this.fromTextEditingController,
    required this.toTextEditingController,
    required this.currencyRepository,
  });

  Future<void> convertCurrency() async {
    if (fromCurrency is! CurrencyEntity || toCurrency is! CurrencyEntity) {
      throw Exception();
    }

    final inputValue = fromTextEditingController.text.replaceAll(',', '.');
    final parsedInputValue = double.parse(inputValue);

    final convertionTypes = {
      ConversionTypes.real: () => parsedInputValue * toCurrency!.real,
      ConversionTypes.dolar: () => parsedInputValue * toCurrency!.dolar,
      ConversionTypes.euro: () => parsedInputValue * toCurrency!.euro,
      ConversionTypes.bitcoin: () => parsedInputValue * toCurrency!.bitcoin,
    };

    final convertedValue = convertionTypes[fromCurrency?.name]!();

    toTextEditingController.text = convertedValue.toStringAsFixed(4);
  }
}
