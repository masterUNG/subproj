import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:subproj/utility/app_constant.dart';
import 'package:subproj/utility/app_controller.dart';
import 'package:subproj/utility/app_service.dart';
import 'package:subproj/widgets/widget_buttom.dart';
import 'package:subproj/widgets/widget_form.dart';
import 'package:subproj/widgets/widget_icon_button.dart';
import 'package:subproj/widgets/widget_image.dart';
import 'package:subproj/widgets/widget_text.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  AppController appController = Get.put(AppController());

  final keyForm = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  width: 250,
                  child: Form(
                    key: keyForm,
                    child: Column(
                      children: [
                        displayLogo(),
                        WidgetForm(
                          textEditingController: userController,
                          validateFunc: (p0) {
                            if (p0?.isEmpty ?? true) {
                              return 'Please Fill User';
                            } else {
                              return null;
                            }
                          },
                          hint: 'User :',
                          suffixWidget: Icon(Icons.person),
                        ),
                        Obx(
                          () => WidgetForm(
                            textEditingController: passwordController,
                            validateFunc: (p0) {
                              if (p0?.isEmpty ?? true) {
                                return 'Please Fill Password';
                              } else {
                                return null;
                              }
                            },
                            hint: 'Password :',
                            obsecu: appController.redEye.value,
                            suffixWidget: WidgetIconButton(
                              iconData: Icons.remove_red_eye,
                              pressFunc: () {
                                appController.redEye.value =
                                    !appController.redEye.value;
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          margin: const EdgeInsets.only(top: 8),
                          child: WidgetButton(
                            text: 'Login',
                            pressFunc: () {
                              if (keyForm.currentState!.validate()) {
                                AppService().checkLogin(
                                    user: userController.text,
                                    password: passwordController.text);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container displayLogo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: WidgetImage(
              size: 64,
            ),
          ),
          WidgetText(
            data: 'Sub ProJ',
            textStyle: AppConstant().h1Style(),
          )
        ],
      ),
    );
  }
}
