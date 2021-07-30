import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Account account1 =
      Account(nameAccount: 'conta1', color: Colors.blue, flagAccount: true);
  // account1.createFinancialRegister(
  //     description: 'tire', category: 'CAR', date: DateTime.now(), value: 50);
  // account1.createFinancialRegister(
  //     description: 'rice', category: 'FOOD', date: DateTime.now(), value: 10);
  // String id1 = account1.financialRegisterList[0].idFinancialRegister;
  // String id2 = account1.financialRegisterList[1].idFinancialRegister;

  User user = User(
    name: 'Usuario 1',
    login: '1234',
    password: 'qwer',
  );

  user.createAccount(nameAccount: 'conta1', color: Colors.blue);

  user.createFinancialRegister(
    description: 'tire',
    category: 'CAR',
    date: DateTime.now(),
    value: 50,
    idAccount: 'conta1',
  );
}
