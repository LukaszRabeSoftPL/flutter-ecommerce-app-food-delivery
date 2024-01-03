import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api/apiclient.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api clinet
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://mvs.bslmeiyu.com'));

  //repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
