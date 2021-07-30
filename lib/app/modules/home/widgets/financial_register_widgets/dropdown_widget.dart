import 'package:ewallet/app/modules/home/home_store.dart';
import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DropdownWidget extends StatefulWidget {
  late List<Account> accountList;

  DropdownWidget({required this.accountList});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends ModularState<DropdownWidget, HomeStore> {
  List<String> convertAccountNamesToList({required List<Account> accounts}) {
    List<String> listAccountsName = [];
    int iterable = 0;

    while (iterable < accounts.length) {
      listAccountsName.add(accounts[iterable].nameAccount);
      iterable++;
    }

    return listAccountsName;
  }

  @override
  Widget build(BuildContext context) {
    String dropdownItem = widget.accountList.first.nameAccount;
    List<String> listAccountNames =
        convertAccountNamesToList(accounts: widget.accountList);
    controller.dropdownNewFinancialRegisterValue = dropdownItem;
    return Container(
      child: Observer(builder: (_) {
        return DropdownButton<String>(
          value: (controller.dropdownWasTappad)
              ? controller.dropdownNewFinancialRegisterValue
              : controller.dropdownNewFinancialRegisterValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: PRIMARY_COLOR),
          underline: Container(height: 2, color: SECONDARY_COLOR),
          onChanged: (String? newValue) {
            controller.dropdownNewFinancialRegisterValue = newValue!;
            controller.dropdownWasTappad = true;
          },
          items: listAccountNames.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      }),
    );
  }
}
