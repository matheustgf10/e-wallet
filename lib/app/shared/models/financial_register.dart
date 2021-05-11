import 'dart:math';

class FinancialRegister {
  final String idFinancialRegister=Random.secure().toString();
  final String description;
  final double value;
  final String category;
  final DateTime dateRegister;
  final String idAccount;

  FinancialRegister({
    //required this.idFinancialRegister,
    required this.description,
    required this.value,
    required this.category,
    required this.dateRegister,
    required this.idAccount,
  });
}
