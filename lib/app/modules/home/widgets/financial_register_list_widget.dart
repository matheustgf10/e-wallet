import 'package:ewallet/app/modules/home/pages/update_financial_register_page.dart';
import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FinancialRegisterListWidget extends StatefulWidget {
  final User user;
  FinancialRegisterListWidget({required this.user});

  @override
  _FinancialRegisterListWidgetState createState() =>
      _FinancialRegisterListWidgetState();
}

class _FinancialRegisterListWidgetState
    extends State<FinancialRegisterListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.user.financialRegisterList.length,
        reverse: true,
        itemBuilder: (_, index) {
          Account account = widget.user.getAccount(
              idAccount: widget.user.financialRegisterList[index].idAccount);

          return InkWell(
            onLongPress: () {
              Modular.to.pushNamed('FinancialRegister/update',
                  arguments: widget.user.financialRegisterList[index]);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget
                            .user.financialRegisterList[index].description),
                        Text(
                          account.nameAccount,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      widget.user.convertValueToRealPattern(
                          value:
                              widget.user.financialRegisterList[index].value),
                      style: TextStyle(
                          color: (widget.user.financialRegisterList[index].value
                                  .isNegative)
                              ? Colors.red
                              : Colors.green),
                    ),
                    trailing: Column(
                      children: [
                        widget.user.financialRegisterList[index].getIcon(),
                        SizedBox(height: 5),
                        Text(
                          widget.user.financialRegisterList[index].dateRegister
                                  .day
                                  .toString() +
                              '/' +
                              widget.user.financialRegisterList[index]
                                  .dateRegister.month
                                  .toString() +
                              '/' +
                              widget.user.financialRegisterList[index]
                                  .dateRegister.year
                                  .toString(),
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
