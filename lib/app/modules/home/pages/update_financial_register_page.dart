import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/home/home_store.dart';
import 'package:ewallet/app/modules/home/widgets/dropdown_widget.dart';
import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:ewallet/app/shared/widgets/custom_app_bar.dart';
import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UpdateFinancialRegisterPage extends StatefulWidget {
  late FinancialRegister financialRegister;

  UpdateFinancialRegisterPage({required this.financialRegister});
  @override
  _UpdateFinancialRegisterPageState createState() =>
      _UpdateFinancialRegisterPageState(financialRegister.idAccount);
}

class _UpdateFinancialRegisterPageState
    extends ModularState<UpdateFinancialRegisterPage, HomeStore> {
  AppStore _appStore = Modular.get<AppStore>();
  TextEditingController _descriptionTextfield = TextEditingController();
  TextEditingController _valueTextfield = TextEditingController();
  late Account account;

  _UpdateFinancialRegisterPageState(String idAccount) {
    account = _appStore.user.getAccount(idAccount: idAccount);
  }

  @override
  Widget build(BuildContext context) {
    _descriptionTextfield.text = widget.financialRegister.description;
    _valueTextfield.text = widget.financialRegister.value.toString();

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        title: CustomAppBar(userName: _appStore.user.name),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: Container(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          color: Colors.blue[300],
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          child: Center(
                            child: Text(
                              account.nameAccount,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Descrição',
                                labelStyle: TextStyle(color: PRIMARY_COLOR)),
                            controller: _descriptionTextfield)),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        children: [
                          Text('Conta '),
                          SizedBox(width: 42),
                          Observer(builder: (_) {
                            return DropdownWidget(
                              accountList: _appStore.user.accountList,
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Valor',
                                labelStyle: TextStyle(color: PRIMARY_COLOR),
                                prefixText: 'R\$ ',
                                prefixStyle: TextStyle(color: PRIMARY_COLOR)),
                            controller: _valueTextfield)),
                    SizedBox(height: 20),
                    Container(
                      child: ElevatedButton(
                          onPressed: () {
                            if (updateFinancialRegister()) {
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Atualizar Registro')),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  bool updateFinancialRegister() {
    FinancialRegister newFinancialRegister = FinancialRegister(
      description: _descriptionTextfield.value.text,
      value: double.parse(_valueTextfield.value.text),
      category: 'COMIDA',
      dateRegister: DateTime.now(),
      idAccount: _appStore.user.getIdAccountByName(
          name: controller.dropdownNewFinancialRegisterValue),
    );

    return _appStore.updateFinancialRegister(
        idFinancialRegister: widget.financialRegister.idFinancialRegister,
        editedFinancialRegister: newFinancialRegister);
  }
}
