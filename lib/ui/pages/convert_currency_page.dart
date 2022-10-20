import 'package:atv_flutter_03/application/contracts/history_currency_repository.dart';
import 'package:atv_flutter_03/application/contracts/user_repository.dart';
import 'package:atv_flutter_03/application/entities/user_entity.dart';
import 'package:atv_flutter_03/presentation/controllers/convert_currency_page_controller.dart';
import 'package:atv_flutter_03/ui/pages/currencies_history_page.dart';
import 'package:atv_flutter_03/ui/widgets/currency_box.dart';
import 'package:flutter/material.dart';

class ConvertCurrencyPage extends StatefulWidget {
  final UserRepository userRepository;
  final HistoryCurrencyRepository historyCurrencyRepository;

  const ConvertCurrencyPage({
    Key? key,
    required this.userRepository,
    required this.historyCurrencyRepository,
  }) : super(key: key);

  @override
  State<ConvertCurrencyPage> createState() => _ConvertCurrencyPageState();
}

class _ConvertCurrencyPageState extends State<ConvertCurrencyPage> {
  late ConvertCurrencyPageController convertCurrencyPageController;

  final fromTextEditingController = TextEditingController();
  final toTextEditingController = TextEditingController();

  UserEntity? user;

  @override
  void initState() {
    super.initState();

    widget.userRepository.currentUser.then((value) {
      setState(() => user = value);
    });

    convertCurrencyPageController = ConvertCurrencyPageController(
      fromTextEditingController: fromTextEditingController,
      toTextEditingController: toTextEditingController,
      historyCurrencyRepository: widget.historyCurrencyRepository,
    );
  }

  void _onConvertButtonPress(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    void onConversionSuccess(void _) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text('Uma nova conversão foi adicionada ao histórico'),
      ));
    }

    void onConversionError(void _) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text(
          'Houve um erro ao relizar a conversão, verifique os campos e tente novamente',
        ),
      ));
    }

    convertCurrencyPageController
        .convertCurrencyAndSaveInHistory(user as UserEntity)
        .then(onConversionSuccess)
        .catchError(onConversionError);
  }

  void _onBackButtonPress(BuildContext context) => Navigator.pop(context);

  void _onActionButtonPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrenciesHistoryPage(
          historyCurrencyRepository: widget.historyCurrencyRepository,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        title: Text(
          'Olá ${user?.name}',
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          height: mediaQuery.size.height,
          child: Column(
            children: [
              CurrencyBox(
                textEditingController: fromTextEditingController,
                selectedCurrency: convertCurrencyPageController.fromCurrency,
                hintText: 'De',
                readOnly: false,
                onChange: (currency) {
                  setState(() {
                    convertCurrencyPageController.fromCurrency = currency;
                  });
                },
              ),
              const SizedBox(height: 16),
              CurrencyBox(
                textEditingController: toTextEditingController,
                selectedCurrency: convertCurrencyPageController.toCurrency,
                hintText: 'Para',
                readOnly: true,
                onChange: (currency) {
                  setState(() {
                    convertCurrencyPageController.toCurrency = currency;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _onConvertButtonPress(context),
                child: Text(
                  'Converter',
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
