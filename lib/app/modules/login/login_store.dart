import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  User generateUser() {
    User user = User(
      login: 'matheustgf64',
      name: 'Matheus Figueirêdo',
      password: '123',
      accountList: [],
    );

    user.createAccount(
        nameAccount: 'Cartão de Crédito',
        color: Colors.pink[200]?.withOpacity(0.7));
    user.createAccount(
        nameAccount: 'Carteira', color: Colors.purple[200]?.withOpacity(0.7));

    user.createFinancialRegister(
      description: 'Almoço',
      value: 15.00,
      category: 'COMIDA',
      date: DateTime.now(),
      idAccount: user.accountList.first.idAccount,
    );

    return user;
  }
}
