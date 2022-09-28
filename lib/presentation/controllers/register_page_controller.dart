import 'package:atv_flutter_03/application/contracts/user_repository.dart';
import 'package:flutter/material.dart';

class RegisterPageController {
  final TextEditingController nameEditingController;
  final TextEditingController emailEditingController;
  final UserRepository userRepository;

  RegisterPageController({
    required this.nameEditingController,
    required this.emailEditingController,
    required this.userRepository,
  });

  Future<void> registerUser() async {
    print('name ' + nameEditingController.text);
    print('email ' + emailEditingController.text);
  }
}
