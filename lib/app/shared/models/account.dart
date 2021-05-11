import 'dart:ui';

import 'package:ewallet/app/shared/models/financial_register.dart';

class Account {
  late String idAccount;
  late String name;
  late List<FinancialRegister> registerList;
  late double totalValue;
  late Color color;
  late bool flagAccount;

  Account({
    required this.idAccount,
    required this.name,
    required this.registerList,
    required this.totalValue,
    required this.color,
    required this.flagAccount,
  });
}
