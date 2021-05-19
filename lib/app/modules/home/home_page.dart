import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/home/home_store.dart';
import 'package:ewallet/app/modules/home/widgets/account_card.dart';
import 'package:ewallet/app/modules/home/widgets/create_account_widget.dart';
import 'package:ewallet/app/modules/home/widgets/financial_register_list_widget.dart';
import 'package:ewallet/app/shared/models/account.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:ewallet/app/shared/widgets/custom_app_bar.dart';
import 'package:ewallet/app/shared/widgets/drawer_menu.dart';
import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  late User user;
  HomePage({Key? key, this.title = "Home", required this.user})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  AppStore _appStore = Modular.get<AppStore>();
  @override
  Widget build(BuildContext context) {
    _appStore.setSize(context: context);
    double height = _appStore.height;
    double width = _appStore.width;

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(userName: widget.user.name),
        backgroundColor: PRIMARY_COLOR,
      ),
      drawer: DrawerMenu(),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Contas
            Container(
              width: width,
              height: height * 0.35,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 80,
                ),
                itemCount: widget.user.accountList.length,
                itemBuilder: (_, index) {
                  return AccountCard(user: widget.user, index: index);
                },
              ),
            ),

            // Registros
            Expanded(
              child: Container(
                child: LayoutBuilder(builder: (_, constraints) {
                  return Container(
                    height: constraints.maxHeight / 2,
                    child: FinancialRegisterListWidget(user: widget.user),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return CreateAccountWidget(height: height, width: width);
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
