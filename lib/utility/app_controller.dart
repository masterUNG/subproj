import 'package:get/get.dart';
import 'package:subproj/models/product_model.dart';

class AppController extends GetxController {
  //คือค่าที่ใช้การกำหนด obsce ที่ WidgetForm
  RxBool redEye = true.obs;

  RxInt indexBody = 0.obs;

  RxList<ProductModel> productModels = <ProductModel>[].obs;
}
