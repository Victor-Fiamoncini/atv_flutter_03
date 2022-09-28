class RegisterValidator {
  static String? nameField(String? value) {
    if (value!.isEmpty) {
      return 'Informe um nome';
    }

    return null;
  }

  static String? emailField(String? value) {
    if (value!.isEmpty || !value.contains('@')) {
      return 'Informe um e-mail válido';
    }

    return null;
  }
}
