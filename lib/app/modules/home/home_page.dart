import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/home/home_store.dart';
import 'package:ewallet/app/modules/home/widgets/account_card.dart';
import 'package:ewallet/app/modules/home/widgets/create_financial_register_widget.dart';
import 'package:ewallet/app/modules/home/widgets/financial_register_list_widget.dart';
import 'package:ewallet/app/shared/widgets/custom_app_bar.dart';
import 'package:ewallet/app/shared/widgets/drawer_menu.dart';
import 'package:ewallet/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key? key, this.title = "Home"}) : super(key: key);

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
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        title: CustomAppBar(userName: _appStore.user.name),
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
              height: height * 0.20,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 80,
                ),
                itemCount: _appStore.user.accountList.length + 1,
                itemBuilder: (_, index) {
                  return (index == _appStore.user.accountList.length)
                      ? Container(
                          child: Row(
                            children: [
                              Container(
                                height: double.maxFinite,
                                width: 180 / 2,
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: TextStyle(fontSize: 36),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : AccountCard(user: _appStore.user, index: index);
                },
              ),
            ),

            // Registros
            Expanded(
              child: Container(
                child: LayoutBuilder(builder: (_, constraints) {
                  return Container(
                    height: constraints.maxHeight / 2,
                    child: Observer(builder: (_) {
                      return (_appStore.user.financialRegisterList.length > 0)
                          ? FinancialRegisterListWidget()
                          : Container(
                              child: Center(
                                child: Text('Nenhum registro por enquanto'),
                              ),
                            );
                    }),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return CreateFinancialRegisterWidget(user: _appStore.user);
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
