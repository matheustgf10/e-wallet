import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AccountMock extends Mock implements Account {}

void main() {
  late Account account;
  late User user;
  late FinancialRegister financialRegister;

  setUpAll(() {
    user = User(
        name: "José Silva",
        login: "jose123",
        password: "123jose",
        accountList: [
          account = Account(
              nameAccount: 'Conta 1', color: Colors.amber, flagAccount: true),
        ]);

    financialRegister = FinancialRegister(
        description: '',
        value: 99.99,
        category: 'FOOD',
        dateRegister: DateTime.now(),
        idAccount: account.idAccount);
    user.financialRegisterList = [financialRegister];
  });

  group('Account crud test', () {
    test("O tamanho de accountList deve ser 1", () {
      expect(user.accountList.length, 1);
    });
    test("A função create deve retornar true", () {
      expect(
          user.createAccount(nameAccount: 'conta2', color: Colors.blue), true);
    });

    test(
        "Se o item existir na lista, a função getAccount deve retornar um Account",
        () {
      expect(user.getAccount(idAccount: account.idAccount), account);
      expect(user.getAccount(idAccount: account.idAccount), isA<Account>());
    });

    test(
        "A função checkAccountExists deve retornar false, se a Conta não existir",
        () {
      expect(user.deleteAccount(idAccount: '1234'), false);
    });

    test("A função checkAccountExists deve retornar true, se a Conta existir",
        () {
      expect(user.checkAccountExists(idAccount: account.idAccount), true);
    });

    group("Teste da função updateAccount() ", () {
      test("Se a conta for atualizada, deve retornar true", () {
        var acc = Account(
          nameAccount: 'Conta 2',
          color: Colors.green,
          flagAccount: true,
        );

        expect(
            user.updateAccount(idAccount: account.idAccount, account: acc), true);
        expect(user.accountList[0].nameAccount, 'Conta 2');
      });

      test(
          "A conta não poderá ser atualizada se houver outra com o mesmo nome, o retorno deve ser: false",
          () {
        Account account3 = Account(
          nameAccount: 'Conta 3',
          color: Colors.amber,
          flagAccount: true,
        );

        Account newAccount = Account(
          nameAccount: 'Conta 3',
          color: Colors.black,
          flagAccount: true,
        );

        user.accountList.add(account3);
        expect(user.updateAccount(idAccount: account.idAccount, account: newAccount),
            false);
      });
    });

    test(
        "Se existirem contas cadastradas, a função getAllAccounts deve retornar uma Lista de Contas",
        () {
      expect(user.getAllAccount(), isA<List<Account>>());
    });
  });

  group('FinancialRegister crud test', () {
    test('deve retorar true ao criar um financialRegister', () {
      expect(
          user.createFinancialRegister(
              description: 'tacos',
              idAccount: account.idAccount,
              category: 'food',
              date: DateTime.now(),
              value: 9.99),
          true);
    });

    test('deve retornar uma lista do tipo FinancialRegister', () {
      expect(user.getAllFinancialRegisters(), isA<List<FinancialRegister>>());
    });

    test('deve retornar um financialRegister', () {
      expect(
          user.getFinancialRegister(
              idFinancialRegister:
                  user.financialRegisterList.first.idFinancialRegister),
          isA<FinancialRegister>());
    });

    group('testes de updateFinancialRegister: ', () {
      test('Deve retornar true ao atualizar um financialRegister', () {
        FinancialRegister newFinancialRegister = FinancialRegister(
          idAccount: account.idAccount,
          description: 'tire',
          category: 'CAR',
          dateRegister: DateTime.now(),
          value: 100,
        );
        expect(
            user.updateFinancialRegister(
                editedFinancialRegister: newFinancialRegister,
                idFinancialRegister:
                    user.financialRegisterList.first.idFinancialRegister),
            true);
      });
      test(
          'Deve retornar false ao tentar atualizar um financialRegister que não existe',
          () {
        FinancialRegister newFinancialRegister = FinancialRegister(
          idAccount: account.idAccount,
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
        expect(
            user.deleteFinancialRegister(
                idFinancialRegister:
                    user.financialRegisterList.first.idFinancialRegister),
            true);
      });

      test(
          'deve retornar false ao tentar deletar o elemento que ja foi deletado',
          () {
        var id = user.financialRegisterList.first.idFinancialRegister;
        user.deleteFinancialRegister(idFinancialRegister: id);
        expect(user.deleteFinancialRegister(idFinancialRegister: id), false);
      });
    });

    test('Deve retornar um double ao executar getTotalValue ', () {
      expect(user.getTotalValue(), isA<double>());
    });
  });
}
