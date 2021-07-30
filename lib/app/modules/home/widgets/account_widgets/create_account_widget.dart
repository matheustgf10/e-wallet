import 'package:ewallet/app/shared/models/account.dart';
import 'package:flutter/material.dart';

class CreateAccountWidget extends StatefulWidget {
  late double height;
  late double width;
  late bool isEditing;
  late Account? editedAccount;
  CreateAccountWidget({required this.height, required this.width,required this.isEditing,this.editedAccount});

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: Container(
        height: widget.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Flexible(
                  child: TextFormField(
                decoration: InputDecoration(labelText: 'Nome da Conta'),
                initialValue: widget.isEditing ?widget.editedAccount!.nameAccount:'',
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
                    child: widget.isEditing?Text("Editar conta"):Text("Criar Conta"),
                    onPressed: () {
                      //criar e editar conta
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
