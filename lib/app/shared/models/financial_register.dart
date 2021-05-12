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

  void printFinancialRegister() {
    print(
      '[ $idFinancialRegister ,$description ,$value ,$category ,$dateRegister ,$idAccount ] ',
    );
  }
}
