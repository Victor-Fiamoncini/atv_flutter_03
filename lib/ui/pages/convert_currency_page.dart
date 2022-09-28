import 'package:atv_flutter_03/application/contracts/currency_repository.dart';
import 'package:atv_flutter_03/application/contracts/user_repository.dart';
import 'package:atv_flutter_03/application/entities/user_entity.dart';
import 'package:atv_flutter_03/ui/pages/currencies_history_page.dart';
import 'package:flutter/material.dart';

class ConvertCurrencyPage extends StatefulWidget {
  final UserRepository userRepository;
  final CurrencyRepository currencyRepository;

  const ConvertCurrencyPage({
    Key? key,
    required this.userRepository,
    required this.currencyRepository,
  }) : super(key: key);

  @override
  State<ConvertCurrencyPage> createState() => _ConvertCurrencyPageState();
}

class _ConvertCurrencyPageState extends State<ConvertCurrencyPage> {
  late UserEntity user;

  @override
  void initState() {
    super.initState();

    widget.userRepository.currentUser.then((value) {
      setState(() => user = value);
    });
  }

  void _onBackButtonPress(BuildContext context) => Navigator.pop(context);

  void _onActionButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrenciesHistoryPage(
          currencyRepository: widget.currencyRepository,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        title: Text(
          'Olá ${user.name}',
          style: TextStyle(
            color: theme.colorScheme.secondary,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: BackButton(
          color: theme.colorScheme.secondary,
          onPressed: () => _onBackButtonPress(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: theme.colorScheme.secondary),
            tooltip: 'Histórico de Conversões',
            onPressed: () => _onActionButtonPress(context),
          ),
        ],
      ),
    );
  }
}
