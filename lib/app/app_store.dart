import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  late double height;
  late double width;

  @observable
  late User user = generateUser();

  @observable
  bool haveNewFinancialRegister = false;

  @observable
  bool hasUpdatedFinancialRegister = false;

  void setSize({required BuildContext context}) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  @action
  bool addFinancialRegister({required FinancialRegister financialRegister}) {
    haveNewFinancialRegister = user.createFinancialRegister(
        description: financialRegister.description,
        value: financialRegister.value,
        category: financialRegister.category,
        date: financialRegister.dateRegister,
        idAccount: financialRegister.idAccount);

    return haveNewFinancialRegister;
  }

  @action
  bool updateFinancialRegister(
      {required FinancialRegister editedFinancialRegister,
      required String idFinancialRegister}) {
    hasUpdatedFinancialRegister = user.updateFinancialRegister(
        idFinancialRegister: idFinancialRegister,
        editedFinancialRegister: editedFinancialRegister);
    return hasUpdatedFinancialRegister;
  }

  User generateUser() {
    User user = User(
      login: 'matheustgf64',
      name: 'Matheus Figueirêdo',
      password: '123',
    );

    user.createAccount(
      nameAccount: 'Carteira',
      color: Colors.orange[100]?.withOpacity(0.9),
    );

    return user;
  }
}
