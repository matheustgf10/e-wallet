import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/home/home_module.dart';
import 'package:ewallet/app/modules/login/login_module.dart';
import 'package:ewallet/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppStore()),
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
