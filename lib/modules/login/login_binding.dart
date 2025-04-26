import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tujuh_sembilan_request/data/remote/api_service.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        apiService: Get.find<ApiService>(),
        secureStorage: Get.find<FlutterSecureStorage>(),
      ),
    );
  }
}
