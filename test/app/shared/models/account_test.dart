import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Account account1 =
      Account(name: 'conta1', color: Colors.blue, flagAccount: true);
  account1.createFinancialRegister(
      description: 'tire', category: 'CAR', date: DateTime.now(), value: 50);
  account1.createFinancialRegister(
      description: 'rice', category: 'FOOD', date: DateTime.now(), value: 10);
  String id1 = account1.financialRegisterList[0].idFinancialRegister;
  String id2 = account1.financialRegisterList[1].idFinancialRegister;

  test('deve retorar true ao criar um financialRegister', () {
    expect(
        account1.createFinancialRegister(
            description: 'tacos',
            category: 'food',
            date: DateTime.now(),
            value: 9.99),
        true);
  });

  test('deve retornar uma lista do tipo FinancialRegister', () {
    expect(account1.getAllFinancialRegisters(), isA<List<FinancialRegister>>());
  });

  test('deve retornar um financialRegister', () {
    expect(account1.getFinancialRegister(idFinancialRegister: id1),
        isA<FinancialRegister>());
  });




group('testes de updateFinaccialRegister: ',(){
  test('Deve retornar true ao atualizar um financialRegister', () {
    FinancialRegister newFinancialRegister = FinancialRegister(
      idAccount: account1.idAccount,
      description: 'tire',
      category: 'CAR',
      dateRegister: DateTime.now(),
      value: 100,
    );
    expect(
        account1.updateFinancialRegister(
            editedFinancialRegister: newFinancialRegister,
            idFinancialRegister: id1),
        true);
  });
  test('Deve retornar false ao tentar atualizar um financialRegister que não existe', () {
    FinancialRegister newFinancialRegister = FinancialRegister(
      idAccount: account1.idAccount,
      description: 'tire',
      category: 'CAR',
      dateRegister: DateTime.now(),
      value: 100,
    );
    expect(
        account1.updateFinancialRegister(
            editedFinancialRegister: newFinancialRegister,
            idFinancialRegister: ''),
        false);
  });
});
  

group(' testes de deleteFinancialRegister: ', () {
    test('deve retornar true deletar o primeiro financialRegister', () {
      expect(account1.deleteFinancialRegister(idFinancialRegister: id1), true);
    });

    test('deve retornar false ao tentar deletar o elemento que ja foi deletado',
        () {
      account1.deleteFinancialRegister(idFinancialRegister: id1);
      expect(account1.deleteFinancialRegister(idFinancialRegister: id1), false);
    });
  });

  
test('Deve retornar um double ao executar getTotalValue ', () {
  expect(account1.getTotalValue(), isA<double>());
  
});

}
