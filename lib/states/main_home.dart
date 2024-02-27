import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subproj/utility/app_controller.dart';
import 'package:subproj/utility/app_dialog.dart';
import 'package:subproj/utility/app_service.dart';
import 'package:subproj/widgets/body_list_product.dart';
import 'package:subproj/widgets/body_profile.dart';
import 'package:subproj/widgets/widget_buttom.dart';
import 'package:subproj/widgets/widget_form.dart';
import 'package:subproj/widgets/widget_icon_button.dart';
import 'package:subproj/widgets/widget_text.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  AppController appController = Get.put(AppController());

  var titles = <String>[
    'List Product',
    'Profile',
  ];

  var iconDatas = <IconData>[
    Icons.list,
    Icons.person,
  ];

  var bodys = <Widget>[
    const BodyListProduct(),
    const BodyProfile(),
  ];

  var items = <BottomNavigationBarItem>[];

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < bodys.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(iconDatas[i]),
          label: titles[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: WidgetText(data: titles[appController.indexBody.value]),
            actions: [
              appController.indexBody.value == 0
                  ? WidgetIconButton(
                      iconData: Icons.add_circle,
                      pressFunc: () {
                        TextEditingController productController =
                            TextEditingController();
                        TextEditingController stockController =
                            TextEditingController();

                        AppDialog().normalDialog(
                            title: 'Add Product',
                            contentWidget: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  WidgetForm(
                                    validateFunc: (p0) {
                                      if (p0?.isEmpty ?? true) {
                                        return 'Please Fill Product';
                                      } else {
                                        return null;
                                      }
                                    },
                                    textEditingController: productController,
                                    labelWidget:
                                        const WidgetText(data: 'Product :'),
                                  ),
                                  WidgetForm(
                                    textInputType: TextInputType.number,
                                    validateFunc: (p0) {
                                      if (p0?.isEmpty ?? true) {
                                        return 'Please Fill Stock';
                                      } else {
                                        return null;
                                      }
                                    },
                                    textEditingController: stockController,
                                    labelWidget:
                                        const WidgetText(data: 'Stock :'),
                                  ),
                                ],
                              ),
                            ),
                            firstWidget: WidgetButton(
                              text: 'Add',
                              pressFunc: () {
                                if (formKey.currentState!.validate()) {
                                  AppService()
                                      .processAddProduct(
                                          product: productController.text,
                                          stock: stockController.text)
                                      .then((value) => Get.back());
                                }
                              },
                            ));
                      },
                    )
                  : const SizedBox()
            ],
          ),
          body: bodys[appController.indexBody.value],
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            currentIndex: appController.indexBody.value,
            onTap: (value) {
              appController.indexBody.value = value;
            },
          ),
        ));
  }
}
