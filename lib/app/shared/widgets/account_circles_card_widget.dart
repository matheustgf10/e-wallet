import 'package:flutter/material.dart';

class AccountCirclesCardWidget extends StatelessWidget {
  const AccountCirclesCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.lerp(
              Alignment.center,
              Alignment.topLeft,
              1.2,
            ),
            child: Image.asset(
              'lib/app/shared/assets/img/oval.png',
              height: 90,
              color: Colors.white38,
            ),
          ),
          Container(
            alignment: Alignment.lerp(
              Alignment.center,
              Alignment.centerRight,
              0,
            ),
            child: Image.asset(
              'lib/app/shared/assets/img/oval.png',
              height: 30,
              color: Colors.white60,
            ),
          ),
          Container(
            alignment: Alignment.lerp(
              Alignment.center,
              Alignment.centerRight,
              0.2,
            ),
            child: Image.asset(
              'lib/app/shared/assets/img/oval.png',
              height: 50,
              color: Colors.white60,
            ),
          ),
          Container(
            alignment: Alignment.lerp(
              Alignment.centerRight,
              Alignment.bottomRight,
              1.7,
            ),
            child: Image.asset(
              'lib/app/shared/assets/img/oval.png',
              height: 70,
              color: Colors.white60,
            ),
          ),
          Container(
            alignment: Alignment.lerp(
              Alignment.center,
              Alignment.bottomRight,
              1.34,
            ),
            child: Image.asset(
              'lib/app/shared/assets/img/oval.png',
              height: 70,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
