import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:subproj/models/user_model.dart';
import 'package:subproj/states/main_home.dart';

class AppService {
  Future<void> checkLogin({
    required String user,
    required String password,
  }) async {
    String urlAPI =
        'https://www.androidthai.in.th/fluttertraining/master/getUserWhereUser.php?isAdd=true&user=$user';

    await Dio().get(urlAPI).then((value) {
      if (value.toString() == 'null') {
        // user False
        Get.snackbar('User False', 'No $user in my Database');
      } else {
        // user True

        for (var element in json.decode(value.data)) {
          UserModel model = UserModel.fromMap(element);

          if (model.password == password) {
            // password true
            Get.offAll(const MainHome());
          } else {
            // password false
            Get.snackbar('Password False', 'Please Try Again');
          }
        }
      }
    });
  }
}
