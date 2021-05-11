import 'package:ewallet/app/shared/models/financial_register.dart';
import 'dart:ui';
import 'dart:math';

class Account {
  late String name;
  final String idAccount = Random.secure().toString();
  late List<FinancialRegister> financialRegisterList = [];
  late double totalValue;
  late Color color;
  late bool flagAccount;

  Account({
    required this.name,
    required this.color,
    required this.flagAccount,
  });

  bool createFinancialRegister(
      {required String description,
      required double value,
      required String category,
      required DateTime date}) {
    FinancialRegister newFinancialRegister = FinancialRegister(
      description: description,
      category: category,
      value: value,
      dateRegister: date,
      idAccount: this.idAccount,
    );
    this.financialRegisterList.add(newFinancialRegister);
    return financialRegisterList.contains(newFinancialRegister);
  }

  List<FinancialRegister> getAllFinancialRegisters() {
    return [...financialRegisterList];
  }

  bool deleteFinancialRegister(String idFinancialRegister){
    
    financialRegisterList.removeWhere((element) => element.idFinancialRegister==idFinancialRegister );
    return true;
  }

  //bool updateFinancialRegistes() {}

  //FinancialRegister getFinantialRegister(String idFinancialRegister){}

  //double getTotalValue() {}

}
