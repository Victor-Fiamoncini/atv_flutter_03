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

  void onFromCurrencyChange(CurrencyEntity? currency) {
    fromCurrency = currency;
  }

  void onToCurrencyChange(CurrencyEntity? currency) {
    toCurrency = currency;
  }

  Future<void> convertCurrency() async {
    if (fromCurrency is! CurrencyEntity || toCurrency is! CurrencyEntity) {
      throw Exception('Houve um erro ao converter, tente novamente');
    }

    final inputValue = toTextEditingController.text.replaceAll(',', '.');
    final parsedInputValue = double.parse(inputValue);

    final convertionTypes = {
      ConversionTypes.real: () => parsedInputValue * toCurrency!.real,
      ConversionTypes.dolar: () => parsedInputValue * toCurrency!.dolar,
      ConversionTypes.euro: () => parsedInputValue * toCurrency!.euro,
      ConversionTypes.bitcoin: () => parsedInputValue * toCurrency!.bitcoin,
    };

    final convertedValue = convertionTypes[fromCurrency?.name]!();

    fromTextEditingController.text = convertedValue.toStringAsFixed(4);
  }
}
