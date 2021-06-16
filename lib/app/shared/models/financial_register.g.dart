// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_register.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FinancialRegister on FinancialRegisterBase, Store {
  final _$idFinancialRegisterAtom =
      Atom(name: 'FinancialRegisterBase.idFinancialRegister');

  @override
  String get idFinancialRegister {
    _$idFinancialRegisterAtom.reportRead();
    return super.idFinancialRegister;
  }

  @override
  set idFinancialRegister(String value) {
    _$idFinancialRegisterAtom.reportWrite(value, super.idFinancialRegister, () {
      super.idFinancialRegister = value;
    });
  }

  final _$descriptionAtom = Atom(name: 'FinancialRegisterBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$valueAtom = Atom(name: 'FinancialRegisterBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$categoryAtom = Atom(name: 'FinancialRegisterBase.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$dateRegisterAtom = Atom(name: 'FinancialRegisterBase.dateRegister');

  @override
  DateTime get dateRegister {
    _$dateRegisterAtom.reportRead();
    return super.dateRegister;
  }

  @override
  set dateRegister(DateTime value) {
    _$dateRegisterAtom.reportWrite(value, super.dateRegister, () {
      super.dateRegister = value;
    });
  }

  final _$idAccountAtom = Atom(name: 'FinancialRegisterBase.idAccount');

  @override
  String get idAccount {
    _$idAccountAtom.reportRead();
    return super.idAccount;
  }

  @override
  set idAccount(String value) {
    _$idAccountAtom.reportWrite(value, super.idAccount, () {
      super.idAccount = value;
    });
  }

  @override
  String toString() {
    return '''
idFinancialRegister: ${idFinancialRegister},
description: ${description},
value: ${value},
category: ${category},
dateRegister: ${dateRegister},
idAccount: ${idAccount}
    ''';
  }
}
