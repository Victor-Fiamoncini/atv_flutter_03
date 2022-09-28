import 'package:atv_flutter_03/application/contracts/currency_repository.dart';
import 'package:atv_flutter_03/application/entities/currency_entity.dart';
import 'package:flutter/material.dart';

class ConvertCurrencyPageController {
  final TextEditingController fromTextEditingController;
  final TextEditingController toTextEditingController;

  CurrencyEntity fromCurrency;
  CurrencyEntity toCurrency;

  final CurrencyRepository currencyRepository;

  ConvertCurrencyPageController({
    required this.fromTextEditingController,
    required this.toTextEditingController,
    required this.fromCurrency,
    required this.toCurrency,
    required this.currencyRepository,
  });

  Future<void> convertCurrency() async {
    try {
      final inputValue = toTextEditingController.text.replaceAll(',', '.');
      final parsedInputValue = double.parse(inputValue);

      final convertionTypes = {
        ConversionTypes.real: () => parsedInputValue * toCurrency.real,
        ConversionTypes.dolar: () => parsedInputValue * toCurrency.dolar,
        ConversionTypes.euro: () => parsedInputValue * toCurrency.euro,
        ConversionTypes.bitcoin: () => parsedInputValue * toCurrency.bitcoin,
      };

      final convertedValue = convertionTypes[fromCurrency.name]!();

      fromTextEditingController.text = convertedValue.toStringAsFixed(4);
    } catch (e) {
      throw 'Houve um erro ao converter, tente novamente';
    }
  }
}
