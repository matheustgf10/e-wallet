import 'package:ewallet/app/shared/models/financial_register.dart';
import 'dart:ui';

import 'package:uuid/uuid.dart';

class Account {
  late String name;
  final String idAccount = 'Account'+Uuid().v4();
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

  dynamic getFinancialRegister({String? idFinancialRegister}) {
    if (checkFinancialRegisterExists(
        idFinancialRegister: idFinancialRegister)) {
      return financialRegisterList.singleWhere(
          (element) => element.idFinancialRegister == idFinancialRegister);
    }
    return null;
  }

  bool updateFinancialRegister(
      {required String idFinancialRegister,
      required FinancialRegister editedFinancialRegister}) {
    if (checkFinancialRegisterExists(
        idFinancialRegister: idFinancialRegister)) {
      int indexfr = financialRegisterList.indexWhere(
          (element) => element.idFinancialRegister == idFinancialRegister);
      financialRegisterList[indexfr].description =
          editedFinancialRegister.description;
      financialRegisterList[indexfr].value = editedFinancialRegister.value;
      financialRegisterList[indexfr].idAccount =
          editedFinancialRegister.idAccount;
      financialRegisterList[indexfr].dateRegister =
          editedFinancialRegister.dateRegister;
      financialRegisterList[indexfr].category =
          editedFinancialRegister.category;
      return true;
    }
    return false;
  }

  bool deleteFinancialRegister({String? idFinancialRegister}) {
    if (checkFinancialRegisterExists(
        idFinancialRegister: idFinancialRegister)) {
      financialRegisterList.removeWhere(
          (element) => element.idFinancialRegister == idFinancialRegister);
      return true;
    }
    return false;
  }

  bool checkFinancialRegisterExists({String? idFinancialRegister}) {
    bool check = financialRegisterList
        .any((element) => element.idFinancialRegister == idFinancialRegister);
    return check;
  }

  void printAllFinancialRegisters() {
    financialRegisterList.forEach((element) {
      element.printFinancialRegister();
    });
  }

  double getTotalValue() {
    double totalValue = 0;
    financialRegisterList.forEach((element) {
      totalValue += element.value;
    });
    return totalValue;
  }
}
