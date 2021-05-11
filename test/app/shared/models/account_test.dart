
import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Account account1= Account(name: 'conta1', color: Colors.blue, flagAccount: true);

  test('deve retorar true ao criar um financialRegister', (){
    expect(account1.createFinancialRegister(description: 'tacos', category: 'food', date: DateTime.now(), value: 9.99), true);
  });

  test('deve retornar uma lista do tipo FinancialRegister', (){
    expect(account1.getAllFinancialRegisters(), isA<List<FinancialRegister>>());
  });
}
