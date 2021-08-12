import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/login/login_store.dart';
import 'package:ewallet/app/modules/login/widgets/textfield_widget.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  AppStore _appStore = Modular.get<AppStore>();

  @override
  Widget build(BuildContext context) {
    _appStore.setSize(context: context);
    return Scaffold(
      backgroundColor: PURPLE_COLOR,
      body: LayoutBuilder(builder: (_, constraints) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: _appStore.height,
            width: _appStore.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text(
                  'Bem vindo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'Roboto',
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Text(
                      'Conecte-se para continuar',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'E-mail',
                      alignLabelWithHint: true,
                      suffixIcon: Icon(
                        Icons.person_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: 'Senha',
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 20, bottom: 20)),
                      onPressed: () {
                        Modular.to
                            .pushNamed('/home', arguments: _appStore.user);
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: _appStore.height * 0.05,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
