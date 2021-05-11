import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AccountMock extends Mock implements Account {}

void main() {
  late User user;
  late AccountMock accountMock;
  late Account account;

  setUpAll(() {
    user = User(
        idUser: "HASH_USER",
        name: "José Silva",
        login: "jose123",
        password: "123jose",
        accountList: [
          account = Account(
              idAccount: '123',
              name: 'Conta 1',
              color: Colors.amber,
              registerList: [],
              totalValue: 99.99,
              flagAccount: true),
        ]);

    accountMock = AccountMock();
  });

  test("O tamanho de accountList deve ser 1", () {
    expect(user.accountList.length, 1);
  });
  test("A função addAccount deve retornar true", () {
    expect(user.addAccount('Conta 1', Colors.amber), true);
  });

  test("A função createAccount deve retornar um Account", () {
    expect(user.createAccount(), AccountMock());
  });

  group('user.getAccount() Test', () {
    test(
        "Se o item existir na lista, a função getAccount deve retornar um Account",
        () {
      expect(user.getAccount(idAccount: '123'), account);
    });

    test(
        "Se o item não existir na lista, a função getAccount deve retornar um StateError",
        () {
      expect(user.getAccount(idAccount: '1234'), isA<Account>());
    });
  });

  test(
      "Se o item não existir na lista, a função deleteAccount deve retornar false",
      () {
    expect(user.deleteAccount(idAccount: '1234'), false);
  });
  group('user.checkAccountExists Test', () {
    test("A função checkAccountExists deve retornar true", () {
      expect(user.checkAccountExists(idAccount: '123'), true);
    });

    test(
        "Se o item não existir na lista, a função checkAccountExists deve retornar false",
        () {
      expect(user.checkAccountExists(idAccount: '1234'), false);
    });
  });
}
