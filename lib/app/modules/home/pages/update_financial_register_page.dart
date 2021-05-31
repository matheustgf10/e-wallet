import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:ewallet/app/shared/widgets/custom_app_bar.dart';
import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UpdateFinancialRegisterPage extends StatefulWidget {
  late FinancialRegister financialRegister;

  UpdateFinancialRegisterPage({required this.financialRegister});
  @override
  _UpdateFinancialRegisterPageState createState() =>
      _UpdateFinancialRegisterPageState();
}

class _UpdateFinancialRegisterPageState
    extends State<UpdateFinancialRegisterPage> {
  AppStore _appStore = Modular.get<AppStore>();
  TextEditingController _descriptionTextfield = TextEditingController();
  TextEditingController _valueTextfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _descriptionTextfield.text = widget.financialRegister.description;
    _valueTextfield.text = widget.financialRegister.value.toString();

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(userName: _appStore.user!.name),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: Container(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.all(10),
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
                              'Carteira',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child:
                            TextFormField(controller: _descriptionTextfield)),
                    SizedBox(height: 20),
                    Container(
                        child: TextFormField(controller: _valueTextfield)),
                    SizedBox(height: 20),
                    Container(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Atualizar Registro')),
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
}
