import 'package:ewallet/app/app_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TextFieldWidget extends StatefulWidget {
  late String label;
  late Icon icon;

  TextFieldWidget({required this.icon, required this.label});
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  AppStore _appStore = Modular.get<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _appStore.width - 60,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'What do people call you?',
          labelText: widget.label,
          suffixIcon: widget.icon,
        ),
      ),
    );
  }
}
