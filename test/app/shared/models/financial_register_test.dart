import 'package:ewallet/app/shared/models/financial_register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FinancialRegister financialRegister = FinancialRegister(
    idFinancialRegister: "HASH1",
    description: "ALMOÇO",
    value: 9.99,
    category: "COMIDA",
    dateRegister: DateTime.now(),
    idAccount: "HASH2",
  );

  test("O valor não pode ser igual a 0", () {
    var predicateValue = predicate(
        (_) => (financialRegister.value > 0 || financialRegister.value < 0));
    expect(financialRegister.value, predicateValue);
  });

  test("O ano deve ser igual ao ano atual", () {
    expect(financialRegister.dateRegister.year, DateTime.now().year);
  });
}
