import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FinancialRegister {
  String idFinancialRegister = 'FINANCIALREGISTER' + Uuid().v4();
  String description;
  double value;
  String category;
  DateTime dateRegister;
  String idAccount;

  FinancialRegister({
    required this.description,
    required this.value,
    required this.category,
    required this.dateRegister,
    required this.idAccount,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '[id:$idFinancialRegister ,description:$description,value:$value,category:$category,date:$dateRegister,nameAccount:$idAccount]';
  }

  Icon getIcon() {
    late Icon icon;
    switch (this.category) {
      case 'COMIDA':
        icon = Icon(Icons.fastfood, color: Colors.red);
        break;
      case 'FINANÇAS':
        icon = Icon(Icons.payments);
        break;
      case 'FUNDOS':
        icon = Icon(Icons.money_rounded, color: Colors.green);
        break;
      default:
        icon = Icon(Icons.shopping_bag_rounded);
        break;
    }

    return icon;
  }
}
