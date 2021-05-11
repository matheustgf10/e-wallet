import 'dart:ui';

import 'package:ewallet/app/shared/models/account.dart';
import 'package:flutter/material.dart';

class User {
  late String idUser;
  late String name;
  late String login;
  late String password;
  late List<Account> accountList;

  User({
    required this.idUser,
    required this.name,
    required this.login,
    required this.password,
    required this.accountList,
  });

  bool addAccount(String accountName, Color accountColor) {
    Account account =
        this.createAccount(name: accountName, color: accountColor);

    this.accountList.add(account);

    return (accountList.isNotEmpty) ? true : false;
  }

  Account createAccount({String? name, Color? color}) {
    Account account = Account(
      idAccount: '',
      name: name.toString(),
      color: color!,
      registerList: [],
      totalValue: 0,
      flagAccount: true,
    );

    return account;
  }

  Account getAccount({String? idAccount}) {
    late Account account;
    account =
        accountList.firstWhere((element) => element.idAccount == idAccount);

    print(account.runtimeType);
    return account;
  }

  bool deleteAccount({String? idAccount}) {
    dynamic isRemoved = false;

    if (this.checkAccountExists(idAccount: idAccount)) {
      accountList.removeWhere(isRemoved =
          (element) => (element.idAccount == idAccount) ? true : false);
    } else {}
    return isRemoved;
  }

  bool checkAccountExists({String? idAccount}) {
    bool check = accountList.any((element) => element.idAccount == idAccount);
    return check;
  }
}
