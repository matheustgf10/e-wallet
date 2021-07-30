// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on AppStoreBase, Store {
  final _$userAtom = Atom(name: 'AppStoreBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$haveNewFinancialRegisterAtom =
      Atom(name: 'AppStoreBase.haveNewFinancialRegister');

  @override
  bool get haveNewFinancialRegister {
    _$haveNewFinancialRegisterAtom.reportRead();
    return super.haveNewFinancialRegister;
  }

  @override
  set haveNewFinancialRegister(bool value) {
    _$haveNewFinancialRegisterAtom
        .reportWrite(value, super.haveNewFinancialRegister, () {
      super.haveNewFinancialRegister = value;
    });
  }

  final _$hasUpdatedFinancialRegisterAtom =
      Atom(name: 'AppStoreBase.hasUpdatedFinancialRegister');

  @override
  bool get hasUpdatedFinancialRegister {
    _$hasUpdatedFinancialRegisterAtom.reportRead();
    return super.hasUpdatedFinancialRegister;
  }

  @override
  set hasUpdatedFinancialRegister(bool value) {
    _$hasUpdatedFinancialRegisterAtom
        .reportWrite(value, super.hasUpdatedFinancialRegister, () {
      super.hasUpdatedFinancialRegister = value;
    });
  }

  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  @override
  bool addFinancialRegister({required FinancialRegister financialRegister}) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.addFinancialRegister');
    try {
      return super.addFinancialRegister(financialRegister: financialRegister);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool updateFinancialRegister(
      {required FinancialRegister editedFinancialRegister,
      required String idFinancialRegister}) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.updateFinancialRegister');
    try {
      return super.updateFinancialRegister(
          editedFinancialRegister: editedFinancialRegister,
          idFinancialRegister: idFinancialRegister);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
haveNewFinancialRegister: ${haveNewFinancialRegister},
hasUpdatedFinancialRegister: ${hasUpdatedFinancialRegister}
    ''';
  }
}
