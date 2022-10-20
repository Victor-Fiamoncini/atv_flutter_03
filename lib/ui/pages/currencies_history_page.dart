import 'package:atv_flutter_03/application/contracts/history_currency_repository.dart';
import 'package:atv_flutter_03/application/entities/history_currency_entity.dart';
import 'package:atv_flutter_03/ui/widgets/history_currency_list_item.dart';
import 'package:flutter/material.dart';

class CurrenciesHistoryPage extends StatefulWidget {
  final HistoryCurrencyRepository historyCurrencyRepository;

  const CurrenciesHistoryPage({
    Key? key,
    required this.historyCurrencyRepository,
  }) : super(key: key);

  @override
  State<CurrenciesHistoryPage> createState() => _CurrenciesHistoryPageState();
}

class _CurrenciesHistoryPageState extends State<CurrenciesHistoryPage> {
  List<HistoryCurrencyEntity> currencies = [];

  @override
  void initState() {
    super.initState();

    widget.historyCurrencyRepository.getAll().then((value) {
      setState(() => currencies = value);
    });
  }

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
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          itemCount: currencies.length,
          itemBuilder: (context, index) => HistoryCurrencyListItem(
            historyCurrency: currencies[index],
          ),
        ),
      ),
    );
  }
}
