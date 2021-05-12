import 'dart:ui';

import 'package:ewallet/app/shared/models/account.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class User {
  late String idUser = 'User'+Uuid().v4();
  late String name;
  late String login;
  late String password;
  late List<Account> accountList;

  User({
    required this.name,
    required this.login,
    required this.password,
    required this.accountList,
  });

  bool addAccount(String accountName, Color accountColor) {
    Account account =
        this.createAccount(name: accountName, color: accountColor);

    this.accountList.add(account);

    return accountList.contains(account);
  }

  bool checkAccountExists({String? idAccount}) {
    bool check = accountList.any((element) => element.idAccount == idAccount);
    return check;
  }

  Account createAccount({String? name, Color? color}) {
    Account account = Account(
      name: name.toString(),
      color: color!,
      flagAccount: true,
    );

    return account;
  }

  dynamic getAccount({String? idAccount}) {
    late Account account;
    dynamic existsAccount = false;

    if (this.checkAccountExists(idAccount: idAccount)) {
      account = accountList.firstWhere(
          existsAccount = (element) => (element.idAccount == idAccount));
    }

    return (existsAccount) ? account : null;
  }

  List<Account> getAllAccount() {
    return [...accountList];
  }

  bool updateAccount({required String idAccount, required Account account}) {
    if (checkAccountExists(idAccount: idAccount)) {
      int index =
          accountList.indexWhere((element) => (element.idAccount == idAccount));

      accountList[index].name = account.name;
      accountList[index].color = account.color;
      return true;
    }
    return false;
  }

  bool deleteAccount({String? idAccount}) {
    dynamic isRemoved = false;

    if (this.checkAccountExists(idAccount: idAccount)) {
      accountList.removeWhere(isRemoved =
          (element) => (element.idAccount == idAccount) ? true : false);
    }

    return isRemoved;
  }
}
