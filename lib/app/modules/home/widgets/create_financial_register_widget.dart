import 'package:ewallet/app/modules/home/home_store.dart';
import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateFinancialRegisterWidget extends StatefulWidget {
  late double height;
  late double width;
  late User user;

  CreateFinancialRegisterWidget(
      {required this.height, required this.width, required this.user});

  @override
  _CreateFinancialRegisterWidgetState createState() =>
      _CreateFinancialRegisterWidgetState();
}

class _CreateFinancialRegisterWidgetState
    extends ModularState<CreateFinancialRegisterWidget, HomeStore> {
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
    String dropdownItem = widget.user.accountList.first.nameAccount;
    List<String> listAccountNames =
        convertAccountNamesToList(accounts: widget.user.accountList);
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: Container(
        height: widget.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Flexible(
                  child: TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
              )),
              SizedBox(
                height: 40,
              ),
              Flexible(
                  child: DropdownButton<String>(
                value: controller.dropdownNewFinancialRegisterValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: PRIMARY_COLOR),
                underline: Container(height: 2, color: SECONDARY_COLOR),
                onChanged: (String? newValue) {
                  controller.dropdownNewFinancialRegisterValue = newValue!;
                },
                items: listAccountNames
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
              SizedBox(
                height: 40,
              ),
              Flexible(
                  child: TextFormField(
                decoration: InputDecoration(labelText: 'Conta'),
              )),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    child: Text("Adicionar Registro"),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
