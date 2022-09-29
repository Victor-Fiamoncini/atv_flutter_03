import 'package:atv_flutter_03/application/entities/currency_entity.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final String hintText;
  final bool readOnly;

  final TextEditingController textEditingController;

  final CurrencyEntity? selectedCurrency;
  final Function(CurrencyEntity?)? onChange;

  const CurrencyBox({
    super.key,
    required this.hintText,
    required this.readOnly,
    required this.textEditingController,
    required this.selectedCurrency,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final currencyItems = CurrencyEntity.currencies.map((currency) {
      return DropdownMenuItem(
        value: currency,
        child: Text(
          currency.name.name.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: DropdownButton(
              value: selectedCurrency,
              hint: Text(
                hintText,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              isExpanded: true,
              iconEnabledColor: theme.colorScheme.primary,
              focusColor: theme.colorScheme.primary,
              underline: Container(
                height: 1,
                color: theme.colorScheme.primary,
              ),
              items: currencyItems,
              onChanged: onChange,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: TextField(
            controller: textEditingController,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: readOnly ? '' : 'Insira um valor',
            ),
            style: TextStyle(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
