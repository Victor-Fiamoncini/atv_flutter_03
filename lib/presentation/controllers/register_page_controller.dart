import 'dart:convert';

import 'package:atv_flutter_03/application/contracts/set_storage.dart';
import 'package:atv_flutter_03/application/contracts/user_repository.dart';
import 'package:atv_flutter_03/application/entities/user_entity.dart';
import 'package:atv_flutter_03/ui/constants.dart';
import 'package:flutter/material.dart';

class RegisterPageController {
  final TextEditingController nameEditingController;
  final TextEditingController emailEditingController;
  final UserRepository userRepository;
  final SetStorage setStorage;

  RegisterPageController({
    required this.nameEditingController,
    required this.emailEditingController,
    required this.userRepository,
    required this.setStorage,
  });

  Future<void> registerUser() async {
    final user = UserEntity(
      name: nameEditingController.text,
      email: emailEditingController.text,
    );

    await userRepository.save(user);
    await setStorage.setValue(
      registeredUserStorageKey,
      jsonEncode(user.toMap()),
    );
  }
}
