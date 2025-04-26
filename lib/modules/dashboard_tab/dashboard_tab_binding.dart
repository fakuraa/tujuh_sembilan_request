import 'package:get/get.dart';
import 'package:tujuh_sembilan_request/modules/dashboard_tab/dashboard_tab_controller.dart';
import 'package:tujuh_sembilan_request/modules/home/home_controller.dart';
import 'package:tujuh_sembilan_request/modules/profile/profile_controller.dart';

class DashboardTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardTabController>(() => DashboardTabController());
  }
}
