import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';

class CategoriesFinancialRegisterListWidget extends StatefulWidget {
  const CategoriesFinancialRegisterListWidget({Key? key}) : super(key: key);

  @override
  _CategoriesFinancialRegisterListWidgetState createState() =>
      _CategoriesFinancialRegisterListWidgetState();
}

class _CategoriesFinancialRegisterListWidgetState
    extends State<CategoriesFinancialRegisterListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.fastfood_rounded,
                  color: Colors.black,
                ),
                color: LIGHT_PURPLE_COLOR,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.attach_money,
                  color: Colors.black,
                ),
                color: LIGHT_GREEN_COLOR,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.credit_card_rounded,
                  color: Colors.black,
                ),
                color: LIGHT_RED_COLOR,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.fastfood_rounded,
                  color: Colors.black,
                ),
                color: LIGHT_BLUE_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
