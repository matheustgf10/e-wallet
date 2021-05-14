import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AccountMock extends Mock implements Account {}

void main() {
  User user = User(
      name: "José Silva",
      login: "jose123",
      password: "123jose",
      accountList: [
        Account(nameAccount: 'conta1', color: Colors.amber, flagAccount: true),
      ]);

  group('Account crud test', () {
    test("O tamanho de accountList deve ser 1", () {
      expect(user.accountList.length, 1);
    });
    test("A funçãcreate deve retornar true", () {
      expect(user.createAccount(nameAccount: 'conta2'), true);
    });

    test("A função createAccount deve retornar um Account", () {
      expect(user.createAccount(), AccountMock());
    });

    group('user.getAccount() Test', () {
      test(
          "Se o item existir na lista, a função getAccount deve retornar um Account",
          () {
        expect(user.getAccount(nameAccount: '123'), account);
        expect(user.getAccount(nameAccount: '123'), isA<Account>());
      });
    });

    test(
        "Se o item não existir na lista, a função deleteAccount deve retornar false",
        () {
      expect(user.deleteAccount(nameAccount: '1234'), false);
    });
    group('user.checkAccountExists Test', () {
      test("A função checkAccountExists deve retornar true", () {
        expect(user.checkAccountExists(nameAccount: '123'), true);
      });

      test(
          "Se o item não existir na lista, a função checkAccountExists deve retornar false",
          () {
        expect(user.checkAccountExists(nameAccount: '1234'), false);
      });

      test("Se a conta for atualizada, deve retornar true", () {
        var account = Account(
          nameAccount: 'Conta 2',
          color: Colors.green,
          flagAccount: true,
        );

        expect(user.updateAccount(nameAccount: '123', account: account), true);
        expect(user.accountList[0].nameAccount, 'Conta 2');
      });

      test(
          "Se existirem contas cadastradas, a função getAllAccounts deve retornar uma Lista de Contas",
          () {
        expect(user.getAllAccount(), isA<List<Account>>());
      });
    });
  });

  group('FinancialRegister crud test', () {
    test('deve retorar true ao criar um financialRegister', () {
      expect(
          user.createFinancialRegister(
              description: 'tacos',
              nameAccount: 'conta1',
              category: 'food',
              date: DateTime.now(),
              value: 9.99),
          true);
    });

    test('deve retornar uma lista do tipo FinancialRegister', () {
      expect(user.getAllFinancialRegisters(), isA<List<FinancialRegister>>());
    });

    test('deve retornar um financialRegister', () {
      expect(user.getFinancialRegister(idFinancialRegister: id1),
          isA<FinancialRegister>());
    });

    group('testes de updateFinaccialRegister: ', () {
      test('Deve retornar true ao atualizar um financialRegister', () {
        FinancialRegister newFinancialRegister = FinancialRegister(
          nameAccount: user.nameAccount,
          description: 'tire',
          category: 'CAR',
          dateRegister: DateTime.now(),
          value: 100,
        );
        expect(
            user.updateFinancialRegister(
                editedFinancialRegister: newFinancialRegister,
                idFinancialRegister: id1),
            true);
      });
      test(
          'Deve retornar false ao tentar atualizar um financialRegister que não existe',
          () {
        FinancialRegister newFinancialRegister = FinancialRegister(
          nameAccount: user.nameAccount,
          description: 'tire',
          category: 'CAR',
          dateRegister: DateTime.now(),
          value: 100,
        );
        expect(
            user.updateFinancialRegister(
                editedFinancialRegister: newFinancialRegister,
                idFinancialRegister: ''),
            false);
      });
    });

    group(' testes de deleteFinancialRegister: ', () {
      test('deve retornar true deletar o primeiro financialRegister', () {
        expect(user.deleteFinancialRegister(idFinancialRegister: id1), true);
      });

      test(
          'deve retornar false ao tentar deletar o elemento que ja foi deletado',
          () {
        user.deleteFinancialRegister(idFinancialRegister: id1);
        expect(user.deleteFinancialRegister(idFinancialRegister: id1), false);
      });
    });

    test('Deve retornar um double ao executar getTotalValue ', () {
      expect(user.getTotalValue(), isA<double>());
    });
  });
}
