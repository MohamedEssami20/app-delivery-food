  String? globalValidationAddressInputs({
    required String value,
    required String message,
  }) {
    if (value.isEmpty || value.trim().isEmpty) {
      return message;
    }
    return null;
  }