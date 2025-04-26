import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tujuh_sembilan_request/data/remote/api_service.dart';
import 'package:tujuh_sembilan_request/main_controller.dart';
import 'package:tujuh_sembilan_request/modules/dashboard_tab/dashboard_tab_binding.dart';
import 'package:tujuh_sembilan_request/modules/dashboard_tab/dashboard_tab_page.dart';
import 'package:tujuh_sembilan_request/modules/loader/loader_page.dart';
import 'package:tujuh_sembilan_request/modules/login/login_binding.dart';
import 'package:tujuh_sembilan_request/modules/login/login_page.dart';
import 'package:tujuh_sembilan_request/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<FlutterSecureStorage>(const FlutterSecureStorage());
  Get.put<ApiService>(ApiService());
  Get.put<MainController>(MainController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: LoaderPage.route,
      getPages: [
        GetPage(name: LoaderPage.route, page: () => const LoaderPage()),
        GetPage(
          name: LoginPage.route,
          page: () => const LoginPage(),
          binding: LoginBinding(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: DashboardTabPage.route,
          page: () => const DashboardTabPage(),
          binding: DashboardTabBinding(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
