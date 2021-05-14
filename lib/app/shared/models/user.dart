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
  bool checkAccountExists({String? nameAccount}) {
    bool check =
        accountList.any((element) => element.nameAccount == nameAccount);
    return check;
  }

  bool createAccount({String? nameAccount, Color? color}) {
    if (checkAccountExists(nameAccount: name)) {
      return false;
    }
    Account account = Account(
        nameAccount: name!,
        color: color!,
        flagAccount: true,
      );
    this.accountList.add(account);
    return accountList.contains(account);
  }

  dynamic getAccount({String? nameAccount}) {
    late Account account;
    dynamic existsAccount = false;

    if (this.checkAccountExists(nameAccount: nameAccount)) {
      account = accountList.firstWhere(
          existsAccount = (element) => (element.nameAccount == nameAccount));
    }

    return (existsAccount) ? account : null;
  }

  List<Account> getAllAccount() {
    return [...accountList];
  }

  bool updateAccount({required String nameAccount, required Account account}) {
    if (checkAccountExists(nameAccount: nameAccount)) {
      int index = accountList
          .indexWhere((element) => (element.nameAccount == nameAccount));

      accountList[index].nameAccount = account.nameAccount;
      accountList[index].color = account.color;
      return true;
    }
    return false;
  }

  bool deleteAccount({String? nameAccount}) {
    dynamic isRemoved = false;

    if (this.checkAccountExists(nameAccount: nameAccount)) {
      accountList.removeWhere(isRemoved =
          (element) => (element.nameAccount == nameAccount) ? true : false);
    }

    return isRemoved;
  }

 
 //crud FinancialRegister
  bool createFinancialRegister(
      {required String description,
      required double value,
      required String category,
      required DateTime date,
      required String nameAccount}) {
    FinancialRegister newFinancialRegister = FinancialRegister(
      description: description,
      category: category,
      value: value,
      dateRegister: date,
      nameAccount: nameAccount,
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
      financialRegisterList[indexfr].nameAccount =
          editedFinancialRegister.nameAccount;
      financialRegisterList[indexfr].dateRegister =
          editedFinancialRegister.dateRegister;
      financialRegisterList[indexfr].category =
          editedFinancialRegister.category;
      return true;
    }
    return false;
  }

  bool checkFinancialRegisterExists({String? idFinancialRegister}) {
    bool check = financialRegisterList
        .any((element) => element.idFinancialRegister == idFinancialRegister);
    return check;
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

  double getTotalValue() {
    double totalValue = 0;
    financialRegisterList.forEach((element) {
      totalValue += element.value;
    });
    return totalValue;
  }

  List<FinancialRegister> getAllFinancialRegisters() {
    return [...financialRegisterList];
  }

  List<FinancialRegister> getAllFinancialRegisterByAccount(
      {required String nameAccount}) {
    List<FinancialRegister> financialRegisterListByAccount =
        financialRegisterList
            .where((element) => element.nameAccount == nameAccount)
            .toList();
    return financialRegisterListByAccount;
  }
}
