import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subproj/utility/app_controller.dart';
import 'package:subproj/widgets/body_list_product.dart';
import 'package:subproj/widgets/body_profile.dart';
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

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: WidgetText(data: titles[appController.indexBody.value]),
          ),
          body: bodys[appController.indexBody.value],
          
        ));
  }
}
