import 'package:atv_flutter_03/application/contracts/user_repository.dart';
import 'package:atv_flutter_03/presentation/controllers/register_page_controller.dart';
import 'package:atv_flutter_03/ui/styles.dart';
import 'package:atv_flutter_03/validators/register_validator.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final UserRepository userRepository;

  const RegisterPage({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterPageController registerPageController;

  final _formKey = GlobalKey<FormState>();

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    registerPageController = RegisterPageController(
      nameEditingController: nameEditingController,
      emailEditingController: emailEditingController,
      userRepository: widget.userRepository,
    );
  }

  Future<void> onFormButtonPress(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    await registerPageController.registerUser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/app_icon.png',
                        width: 140,
                        height: 140,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: nameEditingController,
                        style: defaultTextFormFieldTextStyle(theme),
                        decoration: const InputDecoration(hintText: 'Nome'),
                        validator: RegisterValidator.nameField,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: emailEditingController,
                        style: defaultTextFormFieldTextStyle(theme),
                        decoration: const InputDecoration(hintText: 'E-mail'),
                        validator: RegisterValidator.emailField,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => onFormButtonPress(context),
                        child: Text(
                          'Enviar',
                          style: defaultElevatedButtonTextStyle(theme),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
