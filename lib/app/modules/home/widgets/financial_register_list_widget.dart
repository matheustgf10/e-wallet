import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/home/pages/update_financial_register_page.dart';
import 'package:ewallet/app/modules/home/widgets/financial_register_card_custom.dart';
import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinancialRegisterListWidget extends StatefulWidget {
  FinancialRegisterListWidget();

  @override
  _FinancialRegisterListWidgetState createState() =>
      _FinancialRegisterListWidgetState();
}

class _FinancialRegisterListWidgetState
    extends State<FinancialRegisterListWidget> {
  AppStore _appStore = Modular.get<AppStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        child: ListView.builder(
            itemCount: _appStore.user.financialRegisterList.length,
            reverse: false,
            itemBuilder: (_, index) {
              Account account = _appStore.user.getAccount(
                  idAccount:
                      _appStore.user.financialRegisterList[index].idAccount);
              return InkWell(
                onLongPress: () {
                  Modular.to.pushNamed('FinancialRegister/update',
                      arguments: _appStore.user.financialRegisterList[index]);
                },
                child:
                    FinancialRegisterCardCustom(account: account, index: index),
              );
            }),
      );
    });
  }
}
