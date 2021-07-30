import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/shared/models/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinancialRegisterCardCustom extends StatefulWidget {
  late int index;
  late Account account;

  FinancialRegisterCardCustom({required this.account, required this.index});

  @override
  _FinancialRegisterCardCustomState createState() =>
      _FinancialRegisterCardCustomState();
}

class _FinancialRegisterCardCustomState
    extends State<FinancialRegisterCardCustom> {
  AppStore _appStore = Modular.get<AppStore>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          child: ListTile(
            // leading: Container(
            //     alignment: Alignment.centerLeft,
            //     child: _appStore.user.financialRegisterList[widget.index]
            //         .getIcon()),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_appStore
                    .user.financialRegisterList[widget.index].description),
                Text(
                  widget.account.nameAccount,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            subtitle: Text(
              _appStore.user.convertValueToRealPattern(
                  value:
                      _appStore.user.financialRegisterList[widget.index].value),
              style: TextStyle(
                  color: (_appStore.user.financialRegisterList[widget.index]
                          .value.isNegative)
                      ? Colors.red
                      : Colors.green),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //_appStore.user.financialRegisterList[widget.index].getIcon(),
                Container(
                  child: Text(
                    _appStore.user.convertValueToRealPattern(
                        value: _appStore
                            .user.financialRegisterList[widget.index].value),
                    style: TextStyle(),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  _appStore.user.financialRegisterList[widget.index]
                          .dateRegister.day
                          .toString() +
                      '/0' +
                      _appStore.user.financialRegisterList[widget.index]
                          .dateRegister.month
                          .toString() +
                      '/' +
                      _appStore.user.financialRegisterList[widget.index]
                          .dateRegister.year
                          .toString(),
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
