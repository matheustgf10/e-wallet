import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/home/home_store.dart';
import 'package:ewallet/app/modules/home/widgets/account_card.dart';
import 'package:ewallet/app/modules/home/widgets/create_account_widget.dart';
import 'package:ewallet/app/shared/models/user.dart';
import 'package:ewallet/app/shared/widgets/custom_app_bar.dart';
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
    print('Account ID 1: ' + widget.user.accountList.first.idAccount);
    print('Account ID 2: ' + widget.user.accountList.last.idAccount);
    _appStore.setSize(context: context);
    double height = _appStore.height;
    double width = _appStore.width;

    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(userName: widget.user.name),
        backgroundColor: PRIMARY_COLOR,
      ),
      drawer: Container(
        child: Text('DRAWER MENU'),
      ),
      body: Container(
        height: height,
        width: width,
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
                padding: EdgeInsets.all(20),
                itemCount: widget.user.accountList.length,
                itemBuilder: (_, index) {
                  return AccountCard(
                    accountName: widget.user.accountList[index].nameAccount,
                    accountValue: widget.user.getAccountTotalValue(
                        idAccount: widget.user.accountList[index].idAccount),
                    accountColor: widget.user.accountList[index].color,
                  );
                },
              ),
            ),

            // Registros
            Expanded(
              child: Container(
                child: LayoutBuilder(builder: (_, constraints) {
                  return Container(
                    height: constraints.maxHeight,
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
