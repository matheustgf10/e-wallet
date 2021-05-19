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
        body: Container(
      height: _appStore.height,
      width: _appStore.width,
      child: Column(
        children: [
          SizedBox(
            height: _appStore.height * 0.15,
          ),
          Container(child: Image.asset('lib/app/shared/assets/img/logo.png')),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                child: Text(
              'Conecte-se para continuar',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            )),
          ),
          Container(
            child: TextFieldWidget(
              label: 'E-mail: ',
              icon: Icon(Icons.person_sharp),
            ),
          ),
          Container(
            child: TextFieldWidget(
              label: 'Senha: ',
              icon: Icon(Icons.remove_red_eye_outlined),
            ),
          ),
          Container(
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                User user = controller.generateUser();
                Modular.to.pushReplacementNamed('/home', arguments: user);
              },
              child: Text('Entrar'),
            ),
          ),
          Container(
            child: Text(
              'Esqueceu a senha?',
              style: TextStyle(fontSize: 16, color: SECONDARY_COLOR),
            ),
          ),
          SizedBox(
            height: _appStore.height * 0.05,
          ),
        ],
      ),
    ));
  }
}
