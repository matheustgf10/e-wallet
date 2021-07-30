import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';
part 'account.g.dart';

class Account = AccountBase with _$Account;

abstract class AccountBase with Store {
  @observable
  late String idAccount = 'ACCOUNT' + Uuid().v4();
  @observable
  late String nameAccount;
  @observable
  late Color color;
  @observable
  late bool flagAccount;

  AccountBase({
    required this.nameAccount,
    required this.color,
    this.flagAccount = true,
  });
}
