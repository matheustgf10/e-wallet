import 'dart:ui';

import 'package:ewallet/app/shared/models/account.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
import 'financial_register.dart';

part 'user.g.dart';

class User = UserBase with _$User;

abstract class UserBase with Store {
  @observable
  String idUser = 'USER' + Uuid().v4();

  @observable
  late String name;

  @observable
  late String login;

  @observable
  late String password;

  @observable
  ObservableList<Account> accountList = ObservableList();

  @observable
  late ObservableList<FinancialRegister> financialRegisterList =
      ObservableList();

  UserBase({
    required this.name,
    required this.login,
    required this.password,
  });

  //crud Account
  @action
  bool checkAccountExists({String? idAccount}) {
    return accountList.any((element) => element.idAccount == idAccount);
  }

  @action
  bool createAccount({required String nameAccount, Color? color}) {
    Account account = Account(
      nameAccount: nameAccount,
      color: color ?? Colors.red,
      flagAccount: true,
    );
    this.accountList.add(account);
    return accountList.contains(account);
  }

  @action
  dynamic getAccount({required String idAccount}) {
    if (this.checkAccountExists(idAccount: idAccount)) {
      return accountList
          .firstWhere((element) => (element.idAccount == idAccount));
    }

    return null;
  }

  @action
  String getIdAccountByName({required String name}) {
    var account =
        accountList.firstWhere((element) => (element.nameAccount == name));

    return account.idAccount;
  }

  @action
  List<Account> getAllAccount() {
    return [...accountList];
  }

  @action
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

  @action
  bool deleteAccount({required String idAccount}) {
    dynamic isRemoved = false;
    if (checkAccountExists(idAccount: idAccount)) {
      accountList.removeWhere(isRemoved =
          (element) => (element.idAccount == idAccount) ? true : false);
    }

    return isRemoved;
  }

  @action
  double getTotalValue() {
    double totalValue = 0;
    financialRegisterList.forEach((element) {
      totalValue += element.value;
    });
    return totalValue;
  }

  @action
  double getAccountTotalValue({required String idAccount}) {
    double totalValue = 0;

    financialRegisterList.forEach((element) {
      totalValue += (element.idAccount == idAccount) ? element.value : 0;
    });

    return totalValue;
  }

  //crud FinancialRegister
  @action
  bool checkFinancialRegisterExists({required String idFinancialRegister}) {
    return financialRegisterList
        .any((element) => element.idFinancialRegister == idFinancialRegister);
  }

  @action
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
    this.financialRegisterList.insert(0, newFinancialRegister);

    return financialRegisterList.contains(newFinancialRegister);
  }

  @action
  dynamic getFinancialRegister({required String idFinancialRegister}) {
    if (checkFinancialRegisterExists(
        idFinancialRegister: idFinancialRegister)) {
      return financialRegisterList.singleWhere(
          (element) => element.idFinancialRegister == idFinancialRegister);
    }
    return null;
  }

  @action
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

  @action
  bool deleteFinancialRegister({required String idFinancialRegister}) {
    if (checkFinancialRegisterExists(
        idFinancialRegister: idFinancialRegister)) {
      financialRegisterList.removeWhere(
          (element) => element.idFinancialRegister == idFinancialRegister);
      return true;
    }
    return false;
  }

  @action
  List<FinancialRegister> getAllFinancialRegisters() {
    return [...financialRegisterList];
  }

  @action
  List<FinancialRegister> getAllFinancialRegisterByAccount(
      {required String idAccount}) {
    List<FinancialRegister> financialRegisterListByAccount =
        financialRegisterList
            .where((element) => element.idAccount == idAccount)
            .toList();
    return financialRegisterListByAccount;
  }

  @action
  String convertValueToRealPattern({required double value}) {
    var var1 = value.toStringAsFixed(2);
    var var2 = var1.split('.');
    return "R\$ " + var2[0] + ',' + var2[1];
  }
}
