// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Account on AccountBase, Store {
  final _$idAccountAtom = Atom(name: 'AccountBase.idAccount');

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

  final _$nameAccountAtom = Atom(name: 'AccountBase.nameAccount');

  @override
  String get nameAccount {
    _$nameAccountAtom.reportRead();
    return super.nameAccount;
  }

  @override
  set nameAccount(String value) {
    _$nameAccountAtom.reportWrite(value, super.nameAccount, () {
      super.nameAccount = value;
    });
  }

  final _$colorAtom = Atom(name: 'AccountBase.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$flagAccountAtom = Atom(name: 'AccountBase.flagAccount');

  @override
  bool get flagAccount {
    _$flagAccountAtom.reportRead();
    return super.flagAccount;
  }

  @override
  set flagAccount(bool value) {
    _$flagAccountAtom.reportWrite(value, super.flagAccount, () {
      super.flagAccount = value;
    });
  }

  @override
  String toString() {
    return '''
idAccount: ${idAccount},
nameAccount: ${nameAccount},
color: ${color},
flagAccount: ${flagAccount}
    ''';
  }
}
