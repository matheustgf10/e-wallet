import 'package:flutter/material.dart';

class CreateAccountWidget extends StatefulWidget {
  late double height;
  late double width;
  CreateAccountWidget({required this.height, required this.width});

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height / 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
                child: TextFormField(
              decoration: InputDecoration(labelText: 'Nome da Conta'),
            )),
            SizedBox(
              height: 40,
            ),
            Flexible(
              child: Center(
                child: Container(
                  width: widget.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Escolha uma cor para a conta'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.pink[100],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.deepPurple[100],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.redAccent[100],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.blueAccent[100],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Flexible(
              child: Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  child: Text("Criar Conta"),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
