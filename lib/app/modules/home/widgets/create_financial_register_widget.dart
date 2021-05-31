import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/home/home_store.dart';
import 'package:ewallet/app/modules/home/widgets/dropdown_widget.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateFinancialRegisterWidget extends StatefulWidget {
  AppStore _appStore = Modular.get<AppStore>();
  late User user;

  CreateFinancialRegisterWidget({
    required this.user,
  });

  @override
  _CreateFinancialRegisterWidgetState createState() =>
      _CreateFinancialRegisterWidgetState();
}

class _CreateFinancialRegisterWidgetState
    extends ModularState<CreateFinancialRegisterWidget, HomeStore> {
  TextEditingController _descriptionTextfield = TextEditingController();
  TextEditingController _valueTextfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: widget._appStore.height / 2,
        child: Column(
          children: [
            Flexible(
              child: Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  controller: _descriptionTextfield,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Flexible(
                child: Container(
              alignment: Alignment.centerLeft,
              child: DropdownWidget(accountList: widget.user.accountList),
            )),
            SizedBox(
              height: 40,
            ),
            Flexible(
              child: Container(
                child: TextFormField(
                  controller: _valueTextfield,
                  decoration: InputDecoration(labelText: 'Valor'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  child: Text("Adicionar Registro"),
                  onPressed: () {
                    createFinancialRegister();

                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // void updateFinancialRegister() {
  //   FinancialRegister newFinancialRegister = FinancialRegister(
  //     description: _descriptionTextfield.value.text,
  //     value: double.parse(_valueTextfield.value.text),
  //     category: 'COMIDA',
  //     dateRegister: DateTime.now(),
  //     idAccount:
  //         widget._appStore.user!.financialRegisterList[widget.index!].idAccount,
  //   );

  //   widget._appStore.updateFinancialRegister(
  //       idFinancialRegister: widget._appStore.user!
  //           .financialRegisterList[widget.index!].idFinancialRegister,
  //       editedFinancialRegister: newFinancialRegister);
  // }

  void createFinancialRegister() {
    FinancialRegister _newFinancialRegister = FinancialRegister(
      description: _descriptionTextfield.value.text,
      value: double.parse(_valueTextfield.value.text),
      category: 'COMIDA',
      dateRegister: DateTime.now(),
      idAccount: widget._appStore.user!.getIdAccountByName(
          name: controller.dropdownNewFinancialRegisterValue),
    );
    widget._appStore
        .addFinancialRegister(financialRegister: _newFinancialRegister);
  }
}
