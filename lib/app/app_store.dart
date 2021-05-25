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
  User? user;

  @observable
  bool haveNewFinancialRegister = false;

  @observable
  bool hasUpdatedFinancialRegister = false;

  @action
  bool addFinancialRegister(FinancialRegister financialRegister) {
    user!.financialRegisterList.add(financialRegister);
    return true;
  }

  @action
  void setSize({required BuildContext context}) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
