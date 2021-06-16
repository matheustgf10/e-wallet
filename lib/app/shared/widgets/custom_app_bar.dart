import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  late String userName;

  CustomAppBar({required this.userName});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return Container(
        width: constraints.maxWidth / 2,
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: 5),
            //       child: Container(
            //         child: Text(widget.userName),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8.0),
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(50),
            //         child: Container(
            //           child: Icon(Icons.person),
            //           color: Colors.grey[300],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(child: Text('E-wallet'))
          ],
        ),
      );
    });
  }
}
