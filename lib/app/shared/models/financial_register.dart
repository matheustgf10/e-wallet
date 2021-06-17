import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'financial_register.g.dart';

class FinancialRegister = FinancialRegisterBase with _$FinancialRegister;

abstract class FinancialRegisterBase with Store {
  @observable
  String idFinancialRegister = 'FINANCIALREGISTER' + Uuid().v4();

  @observable
  late String description;

  @observable
  late double value;

  @observable
  late String category;

  @observable
  late DateTime dateRegister;

  @observable
  late String idAccount;

  FinancialRegisterBase({
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
        icon = Icon(Icons.fastfood, color: Colors.black);
        break;
      case 'FINANÇAS':
        icon = Icon(Icons.payments, color: Colors.black);
        break;
      case 'FUNDOS':
        icon = Icon(Icons.money_rounded, color: Colors.black);
        break;
      default:
        icon = Icon(Icons.shopping_bag_rounded, color: Colors.black);
        break;
    }

    return icon;
  }
}
