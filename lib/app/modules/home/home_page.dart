import 'package:carousel_slider/carousel_slider.dart';
import 'package:ewallet/app/app_store.dart';
import 'package:ewallet/app/modules/home/home_store.dart';
import 'package:ewallet/app/modules/home/widgets/account_widgets/account_card.dart';
import 'package:ewallet/app/modules/home/widgets/financial_register_widgets/categories_financial_register_list_widget.dart';
import 'package:ewallet/app/modules/home/widgets/financial_register_widgets/create_financial_register_widget.dart';
import 'package:ewallet/app/modules/home/widgets/financial_register_widgets/financial_register_list_widget.dart';
import 'package:ewallet/app/shared/widgets/custom_app_bar.dart';

import 'package:ewallet/app/utils/colors.dart';
import 'package:ewallet/app/utils/constants.dart';
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
      backgroundColor: PURPLE_COLOR,
      body: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomAppBarWidget(userName: 'Matheus Figueirêdo'),
            Container(
              child: LayoutBuilder(builder: (_, constraints) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: height * 0.8,
                    color: Colors.white,
                    child: Column(
                      children: [
                        // Accounts
                        Container(
                          width: width,
                          height: height * 0.25,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 20,
                                  bottom: 10,
                                ),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text('Minhas Contas',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 150,
                                  child: CarouselSlider.builder(
                                    itemCount:
                                        _appStore.user.accountList.length,
                                    itemBuilder: (BuildContext context,
                                            int index, int i) =>
                                        Container(
                                            child: AccountCard(
                                                index: index,
                                                user: _appStore.user)),
                                    options: CarouselOptions(
                                      height: 200,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 0.7,
                                      initialPage: 0,
                                      enableInfiniteScroll: false,
                                      reverse: false,
                                      autoPlay: false,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration: Duration(
                                        milliseconds: 800,
                                      ),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Register Categories
                        CategoriesFinancialRegisterListWidget(),
                        // Registers
                        Expanded(
                          child: Container(
                            child: LayoutBuilder(builder: (_, constraints) {
                              return Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Registros',
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: constraints.maxHeight - 41,
                                      child: Observer(builder: (_) {
                                        return (_appStore
                                                    .user
                                                    .financialRegisterList
                                                    .length >
                                                0)
                                            ? FinancialRegisterListWidget()
                                            : Container(
                                                child: Center(
                                                  child: Text(
                                                    'Nenhum registro por enquanto',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                ),
                                              );
                                      }),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PURPLE_ACCENT_COLOR,
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
