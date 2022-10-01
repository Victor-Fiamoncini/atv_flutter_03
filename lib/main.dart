import 'package:atv_flutter_03/application/contracts/history_currency_repository.dart';
import 'package:atv_flutter_03/application/contracts/user_repository.dart';
import 'package:atv_flutter_03/infra/repositories/memory_history_currency_repository.dart';
import 'package:atv_flutter_03/infra/repositories/memory_user_repository.dart';
import 'package:atv_flutter_03/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  final userRepository = MemoryUserRepository();
  final historyCurrencyRepository = MemoryHistoryCurrencyRepository();

  final app = App(
    userRepository: userRepository,
    historyCurrencyRepository: historyCurrencyRepository,
  );

  runApp(app);
}

class App extends StatelessWidget {
  final UserRepository userRepository;
  final HistoryCurrencyRepository historyCurrencyRepository;

  const App({
    Key? key,
    required this.userRepository,
    required this.historyCurrencyRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.amber.shade300,
        systemNavigationBarColor: Colors.amber.shade300,
      ),
    );

    return MaterialApp(
      title: 'Conversor de Moedas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.amber.shade300,
          onPrimary: Colors.amber.shade300,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white30,
          onBackground: Colors.white30,
          surface: Colors.white,
          onSurface: Colors.white,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.amber.withOpacity(0.9),
          selectionHandleColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.amber.shade300),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          filled: true,
          fillColor: Colors.amber.shade300,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          errorStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.red,
          actionTextColor: Colors.white,
        ),
      ),
      home: RegisterPage(
        userRepository: userRepository,
        historyCurrencyRepository: historyCurrencyRepository,
      ),
    );
  }
}
