import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  late String accountName;
  late double accountValue;
  late Color accountColor;

  AccountCard({
    required this.accountName,
    required this.accountValue,
    required this.accountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: accountColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  accountName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "R\$ " + accountValue.ceil().toString() + ",00",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: (accountValue.isNegative)
                        ? Colors.red[600]
                        : Colors.green[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
