// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on UserBase, Store {
  final _$idUserAtom = Atom(name: 'UserBase.idUser');

  @override
  String get idUser {
    _$idUserAtom.reportRead();
    return super.idUser;
  }

  @override
  set idUser(String value) {
    _$idUserAtom.reportWrite(value, super.idUser, () {
      super.idUser = value;
    });
  }

  final _$nameAtom = Atom(name: 'UserBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$loginAtom = Atom(name: 'UserBase.login');

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$passwordAtom = Atom(name: 'UserBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$accountListAtom = Atom(name: 'UserBase.accountList');

  @override
  ObservableList<Account> get accountList {
    _$accountListAtom.reportRead();
    return super.accountList;
  }

  @override
  set accountList(ObservableList<Account> value) {
    _$accountListAtom.reportWrite(value, super.accountList, () {
      super.accountList = value;
    });
  }

  final _$financialRegisterListAtom =
      Atom(name: 'UserBase.financialRegisterList');

  @override
  ObservableList<FinancialRegister> get financialRegisterList {
    _$financialRegisterListAtom.reportRead();
    return super.financialRegisterList;
  }

  @override
  set financialRegisterList(ObservableList<FinancialRegister> value) {
    _$financialRegisterListAtom.reportWrite(value, super.financialRegisterList,
        () {
      super.financialRegisterList = value;
    });
  }

  final _$UserBaseActionController = ActionController(name: 'UserBase');

  @override
  bool checkAccountExists({String? idAccount}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.checkAccountExists');
    try {
      return super.checkAccountExists(idAccount: idAccount);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool createAccount({required String nameAccount, Color? color}) {
    final _$actionInfo =
        _$UserBaseActionController.startAction(name: 'UserBase.createAccount');
    try {
      return super.createAccount(nameAccount: nameAccount, color: color);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getAccount({required String idAccount}) {
    final _$actionInfo =
        _$UserBaseActionController.startAction(name: 'UserBase.getAccount');
    try {
      return super.getAccount(idAccount: idAccount);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getIdAccountByName({required String name}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.getIdAccountByName');
    try {
      return super.getIdAccountByName(name: name);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Account> getAllAccount() {
    final _$actionInfo =
        _$UserBaseActionController.startAction(name: 'UserBase.getAllAccount');
    try {
      return super.getAllAccount();
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool updateAccount({required String idAccount, required Account account}) {
    final _$actionInfo =
        _$UserBaseActionController.startAction(name: 'UserBase.updateAccount');
    try {
      return super.updateAccount(idAccount: idAccount, account: account);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool deleteAccount({required String idAccount}) {
    final _$actionInfo =
        _$UserBaseActionController.startAction(name: 'UserBase.deleteAccount');
    try {
      return super.deleteAccount(idAccount: idAccount);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getTotalValue() {
    final _$actionInfo =
        _$UserBaseActionController.startAction(name: 'UserBase.getTotalValue');
    try {
      return super.getTotalValue();
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getAccountTotalValue({required String idAccount}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.getAccountTotalValue');
    try {
      return super.getAccountTotalValue(idAccount: idAccount);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkFinancialRegisterExists({required String idFinancialRegister}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.checkFinancialRegisterExists');
    try {
      return super.checkFinancialRegisterExists(
          idFinancialRegister: idFinancialRegister);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool createFinancialRegister(
      {required String description,
      required double value,
      required String category,
      required DateTime date,
      required String idAccount}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.createFinancialRegister');
    try {
      return super.createFinancialRegister(
          description: description,
          value: value,
          category: category,
          date: date,
          idAccount: idAccount);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getFinancialRegister({required String idFinancialRegister}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.getFinancialRegister');
    try {
      return super
          .getFinancialRegister(idFinancialRegister: idFinancialRegister);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool updateFinancialRegister(
      {required String idFinancialRegister,
      required FinancialRegister editedFinancialRegister}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.updateFinancialRegister');
    try {
      return super.updateFinancialRegister(
          idFinancialRegister: idFinancialRegister,
          editedFinancialRegister: editedFinancialRegister);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool deleteFinancialRegister({required String idFinancialRegister}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.deleteFinancialRegister');
    try {
      return super
          .deleteFinancialRegister(idFinancialRegister: idFinancialRegister);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<FinancialRegister> getAllFinancialRegisters() {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.getAllFinancialRegisters');
    try {
      return super.getAllFinancialRegisters();
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<FinancialRegister> getAllFinancialRegisterByAccount(
      {required String idAccount}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.getAllFinancialRegisterByAccount');
    try {
      return super.getAllFinancialRegisterByAccount(idAccount: idAccount);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String convertValueToRealPattern({required double value}) {
    final _$actionInfo = _$UserBaseActionController.startAction(
        name: 'UserBase.convertValueToRealPattern');
    try {
      return super.convertValueToRealPattern(value: value);
    } finally {
      _$UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idUser: ${idUser},
name: ${name},
login: ${login},
password: ${password},
accountList: ${accountList},
financialRegisterList: ${financialRegisterList}
    ''';
  }
}
