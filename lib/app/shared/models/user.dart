import 'dart:ui';

import 'package:ewallet/app/shared/models/account.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'financial_register.dart';

class User {
  late String idUser = 'USER' + Uuid().v4();
  late String name;
  late String login;
  late String password;
  late List<Account> accountList;
  late List<FinancialRegister> financialRegisterList = [];

  User({
    required this.name,
    required this.login,
    required this.password,
    required this.accountList,
  });

  //crud Account
  bool checkAccountExists({String? idAccount}) {
    return accountList.any((element) => element.idAccount == idAccount);
  }

  bool createAccount({String? nameAccount, Color? color}) {
    Account account = Account(
      nameAccount: nameAccount ?? '',
      color: color ?? Colors.red,
      flagAccount: true,
    );
    this.accountList.add(account);
    return accountList.contains(account);
  }

  dynamic getAccount({String? idAccount}) {
    if (this.checkAccountExists(idAccount: idAccount)) {
      return accountList
          .firstWhere((element) => (element.idAccount == idAccount));
    }

    return null;
  }

  List<Account> getAllAccount() {
    return [...accountList];
  }

  bool updateAccount({required String idAccount, required Account account}) {
    if (checkAccountExists(idAccount: idAccount)) {
      if (!(accountList
          .any((element) => element.nameAccount == account.nameAccount))) {
        int index = accountList
            .indexWhere((element) => (element.idAccount == idAccount));

        accountList[index].nameAccount = account.nameAccount;
        accountList[index].color = account.color;
        return true;
      }
    }
    return false;
  }

  bool deleteAccount({String? idAccount}) {
    dynamic isRemoved = false;
    if (checkAccountExists(idAccount: idAccount)) {
      accountList.removeWhere(isRemoved =
          (element) => (element.idAccount == idAccount) ? true : false);
    }

    return isRemoved;
  }

  double getTotalValue() {
    double totalValue = 0;
    financialRegisterList.forEach((element) {
      totalValue += element.value;
    });
    return totalValue;
  }

  double getAccountTotalValue({required String idAccount}) {
    double totalValue = 0;

    financialRegisterList.forEach((element) {
      totalValue += (element.idAccount == idAccount) ? element.value : 0;
    });

    return totalValue;
  }

  //crud FinancialRegister
  bool checkFinancialRegisterExists({String? idFinancialRegister}) {
    return financialRegisterList
        .any((element) => element.idFinancialRegister == idFinancialRegister);
  }

  bool createFinancialRegister(
      {required String description,
      required double value,
      required String category,
      required DateTime date,
      required String idAccount}) {
    FinancialRegister newFinancialRegister = FinancialRegister(
      description: description,
      category: category,
      value: value,
      dateRegister: date,
      idAccount: idAccount,
    );
    this.financialRegisterList.add(newFinancialRegister);
    return financialRegisterList.contains(newFinancialRegister);
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

  List<FinancialRegister> getAllFinancialRegisters() {
    return [...financialRegisterList];
  }

  List<FinancialRegister> getAllFinancialRegisterByAccount(
      {required String idAccount}) {
    List<FinancialRegister> financialRegisterListByAccount =
        financialRegisterList
            .where((element) => element.idAccount == idAccount)
            .toList();
    return financialRegisterListByAccount;
  }
}
