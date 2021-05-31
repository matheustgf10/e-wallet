import 'package:ewallet/app/modules/home/pages/update_financial_register_page.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) {
      User user = args.data;
      return HomePage(user: user);
    }),
    ChildRoute('FinancialRegister/update', child: (_, args) {
      return UpdateFinancialRegisterPage(financialRegister: args.data);
    }),
  ];
}
