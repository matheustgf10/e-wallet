import 'package:uuid/uuid.dart';

class FinancialRegister {
  String idFinancialRegister = 'FINANCIALREGISTER' + Uuid().v4();
  String description;
  double value;
  String category;
  DateTime dateRegister;
  String idAccount;

  FinancialRegister({
    //required this.idFinancialRegister,
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
}
