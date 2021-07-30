// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$dropdownNewFinancialRegisterValueAtom =
      Atom(name: 'HomeStoreBase.dropdownNewFinancialRegisterValue');

  @override
  String get dropdownNewFinancialRegisterValue {
    _$dropdownNewFinancialRegisterValueAtom.reportRead();
    return super.dropdownNewFinancialRegisterValue;
  }

  @override
  set dropdownNewFinancialRegisterValue(String value) {
    _$dropdownNewFinancialRegisterValueAtom
        .reportWrite(value, super.dropdownNewFinancialRegisterValue, () {
      super.dropdownNewFinancialRegisterValue = value;
    });
  }

  final _$dropdownWasTappadAtom = Atom(name: 'HomeStoreBase.dropdownWasTappad');

  @override
  bool get dropdownWasTappad {
    _$dropdownWasTappadAtom.reportRead();
    return super.dropdownWasTappad;
  }

  @override
  set dropdownWasTappad(bool value) {
    _$dropdownWasTappadAtom.reportWrite(value, super.dropdownWasTappad, () {
      super.dropdownWasTappad = value;
    });
  }

  @override
  String toString() {
    return '''
dropdownNewFinancialRegisterValue: ${dropdownNewFinancialRegisterValue},
dropdownWasTappad: ${dropdownWasTappad}
    ''';
  }
}
