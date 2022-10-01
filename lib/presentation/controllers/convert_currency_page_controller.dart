import 'package:atv_flutter_03/application/contracts/history_currency_repository.dart';
import 'package:atv_flutter_03/application/entities/currency_entity.dart';
import 'package:atv_flutter_03/application/entities/history_currency_entity.dart';
import 'package:atv_flutter_03/application/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ConvertCurrencyPageController {
  CurrencyEntity? fromCurrency;
  CurrencyEntity? toCurrency;

  final TextEditingController fromTextEditingController;
  final TextEditingController toTextEditingController;
  final HistoryCurrencyRepository historyCurrencyRepository;

  ConvertCurrencyPageController({
    required this.fromTextEditingController,
    required this.toTextEditingController,
    required this.historyCurrencyRepository,
  });

  Future<void> convertCurrencyAndSaveInHistory(UserEntity user) async {
    if (fromCurrency is! CurrencyEntity || toCurrency is! CurrencyEntity) {
      throw Exception();
    }

    final inputValue = fromTextEditingController.text.replaceAll(',', '.');
    final parsedInputValue = double.parse(inputValue);

    final conversionTypesCalculations = {
      ConversionTypes.real: () => parsedInputValue * toCurrency!.real,
      ConversionTypes.dolar: () => parsedInputValue * toCurrency!.dolar,
      ConversionTypes.euro: () => parsedInputValue * toCurrency!.euro,
      ConversionTypes.bitcoin: () => parsedInputValue * toCurrency!.bitcoin,
    };

    final convertedValue = conversionTypesCalculations[fromCurrency?.name]!();
    toTextEditingController.text = convertedValue.toStringAsFixed(4);

    final historyCurrency = HistoryCurrencyEntity(
      user: user,
      fromConversionType: fromCurrency!.name,
      toConversionType: toCurrency!.name,
      fromValue: fromTextEditingController.text,
      toValue: toTextEditingController.text,
    );

    await historyCurrencyRepository.save(historyCurrency);
  }
}
