import 'package:ewallet/app/utils/categories.dart';

class FinancialRegister {
  late String idFinancialRegister;
  late String description;
  late double value;
  late String category;
  late DateTime dateRegister;
  late String idAccount;

  FinancialRegister({
    required this.idFinancialRegister,
    required this.description,
    required this.value,
    required this.category,
    required this.dateRegister,
    required this.idAccount,
  });
}
