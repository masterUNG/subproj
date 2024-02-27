import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subproj/utility/app_constant.dart';
import 'package:subproj/utility/app_controller.dart';
import 'package:subproj/utility/app_dialog.dart';
import 'package:subproj/utility/app_service.dart';
import 'package:subproj/widgets/widget_buttom.dart';
import 'package:subproj/widgets/widget_form.dart';
import 'package:subproj/widgets/widget_icon_button.dart';
import 'package:subproj/widgets/widget_text.dart';

class BodyListProduct extends StatefulWidget {
  const BodyListProduct({super.key});

  @override
  State<BodyListProduct> createState() => _BodyListProductState();
}

class _BodyListProductState extends State<BodyListProduct> {
  //Depency สำหรับ Call ตัวแปรพวก Rx
  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    AppService().processReadAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => appController.productModels.isEmpty
        ? const SizedBox()
        : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: appController.productModels.length,
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WidgetText(
                          data: appController.productModels[index].nameProduct,
                          textStyle: AppConstant().h2Style(),
                        ),
                        WidgetText(
                            data:
                                'Stock = ${appController.productModels[index].stock} pic'),
                      ],
                    ),
                    WidgetIconButton(
                      iconData: Icons.edit,
                      pressFunc: () {
                        TextEditingController textEditingController =
                            TextEditingController();

                        textEditingController.text =
                            appController.productModels[index].stock;

                        AppDialog().normalDialog(
                            title:
                                appController.productModels[index].nameProduct,
                            contentWidget: WidgetForm(
                              textEditingController: textEditingController,
                              labelWidget: const WidgetText(data: 'Stock'),
                              textInputType: TextInputType.number,
                            ),
                            firstWidget: WidgetButton(
                              text: 'Edit',
                              pressFunc: () {
                                Get.back();
                              },
                            ));
                      },
                    )
                  ],
                ),
                const Divider(),
              ],
            ),
          ));
  }
}
