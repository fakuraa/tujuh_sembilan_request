import 'package:get/get.dart';
import 'package:tujuh_sembilan_request/data/model/user.dart';
import 'package:tujuh_sembilan_request/data/remote/api_service.dart';
import 'package:tujuh_sembilan_request/modules/dashboard_tab/dashboard_tab_page.dart';
import 'package:tujuh_sembilan_request/modules/login/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainController extends GetxController {
  final FlutterSecureStorage storage = Get.find<FlutterSecureStorage>();
  var apiService = Get.find<ApiService>();

  @override
  void onInit() {
    super.onInit();
    apiService.onUnauthorized = logout;
    _checkAuth();
  }

  void logout() {
    storage.deleteAll();
    if (Get.currentRoute != LoginPage.route) {
      Get.offAllNamed(LoginPage.route);
    }
  }

  void _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    final isLoggedIn = await _isUserLoggedIn();

    final nextRoute = isLoggedIn ? DashboardTabPage.route : LoginPage.route;
    Get.offAllNamed(nextRoute);
  }

  Future<bool> _isUserLoggedIn() async {
    final userJson = await storage.read(key: "user");
    if (userJson == null) return false;
    try {
      final user = User.fromJson(userJson);
      return user.accessToken != null;
    } catch (e) {
      return false;
    }
  }
}
