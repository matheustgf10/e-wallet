import 'dart:ui';

import 'package:uuid/uuid.dart';

class Account {
  late String idAccount = 'ACCOUNT' + Uuid().v4();
  late String nameAccount;
  late Color color;
  late bool flagAccount;

  Account({
    required this.nameAccount,
    required this.color,
    this.flagAccount = true,
  });
}
