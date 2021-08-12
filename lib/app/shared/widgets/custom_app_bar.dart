import 'package:ewallet/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBarWidget extends StatefulWidget {
  late String userName;

  CustomAppBarWidget({required this.userName});

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '${widget.userName}',
                      style: TEXT_WIDGET_STYLE,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Bem-vindo de volta!',
                      style: TEXT_WIDGET_STYLE_2,
                    ),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Modular.to.pop(context);
                },
                child: Container(
                  child: Icon(Icons.tune, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
