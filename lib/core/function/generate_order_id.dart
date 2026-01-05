// create method that generate order id as int;

import 'dart:math';
  int generateOrderId() {
    final random = Random.secure();
    final codeUnits = List.generate(10, (_) => random.nextInt(10));
    return int.parse(codeUnits.join(''), radix: 10);
  }


