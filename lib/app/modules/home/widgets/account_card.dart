import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_store.dart';
import 'create_account_widget.dart';

class AccountCard extends StatefulWidget {
  late User user;
  late int index;

  AccountCard({required this.user, required this.index});

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  AppStore _appStore = Modular.get<AppStore>();
  @override
  Widget build(BuildContext context) {
    _appStore.setSize(context: context);
    double height = _appStore.height;
    double width = _appStore.width;
    double value = widget.user.getAccountTotalValue(
        idAccount: widget.user.accountList[widget.index].idAccount);
    return InkWell(
      //createAccount
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              return CreateAccountWidget(
                  isEditing: false, height: height, width: width);
            });
      },
      //Edit account
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              return CreateAccountWidget(
                  isEditing: true,
                  editedAccount: widget.user.accountList[widget.index],
                  height: height,
                  width: width);
            });
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: widget.user.accountList[widget.index].color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.user.accountList[widget.index].nameAccount,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Text(
                    widget.user.convertValueToRealPattern(value: value),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: (value.isNegative)
                          ? Colors.red[600]
                          : Colors.green[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
