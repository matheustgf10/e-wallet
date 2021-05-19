import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  late User user;
  late int index;

  AccountCard({required this.user, required this.index});

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    double value = widget.user.getAccountTotalValue(
        idAccount: widget.user.accountList[widget.index].idAccount);
    return InkWell(
      onTap: () {},
      onLongPress: () {},
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
