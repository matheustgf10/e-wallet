import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(builder: (_, constraints) {
        return Column(
          children: [DrawerHeader(child: Container())],
        );
      }),
    );
  }
}
