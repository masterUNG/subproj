import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subproj/widgets/widget_buttom.dart';
import 'package:subproj/widgets/widget_text.dart';

class AppDialog {
  void normalDialog({
    required String title,
    Widget? contentWidget,
    Widget? firstWidget,
  }) {
    Get.dialog(AlertDialog(
      title: WidgetText(data: title),
      content: contentWidget,
      actions: [
        firstWidget ?? const SizedBox(),
        WidgetButton(
          text: 'Cancel',
          pressFunc: () => Get.back(),
        )
      ],
    ));
  }
}
