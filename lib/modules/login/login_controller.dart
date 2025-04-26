import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tujuh_sembilan_request/data/remote/api_service.dart';
import 'package:tujuh_sembilan_request/modules/dashboard_tab/dashboard_tab_page.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final isLoading = false.obs;

  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  var obsecure = true.obs;

  LoginController({required this.apiService, required this.secureStorage});

  setObsecure() => obsecure.value = !obsecure.value;

  void login() async {
    if (!formKey.currentState!.saveAndValidate()) return;

    final formData = formKey.currentState!.value;
    final username = formData['username'];
    final password = formData['password'];

    isLoading.value = true;

    try {
      final user = await apiService.login(
        username: username,
        password: password,
      );

      if (user != null) {
        apiService.setAuthToken(user.accessToken!);
        await secureStorage.write(key: 'user', value: user.toJson());
        Get.offAllNamed(DashboardTabPage.route);
      } else {
        _showError('Login failed. Please try again.');
      }
    } on DioException catch (e) {
      _showError(e.message ?? 'Login failed. Please try again.');
    } catch (e) {
      _showError('Login failed. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  void _showError(String message) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      borderRadius: 12,
      margin: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: Colors.red.shade400,
      messageText: Text(message, style: TextStyle(color: Colors.white)),
    );
  }
}
