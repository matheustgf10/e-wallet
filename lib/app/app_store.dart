import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  late double height;
  late double width;

  @action
  void setSize({required BuildContext context}) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
