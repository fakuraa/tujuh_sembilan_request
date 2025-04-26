import 'package:get/get.dart';

class DashboardTabController extends GetxController {
  final RxBool isLoading = false.obs;
  var selectedTab = 0;

  setSelectedTab(val) {
    selectedTab = val;
    update();
  }
}
