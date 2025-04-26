import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tujuh_sembilan_request/data/model/user.dart';
import 'package:tujuh_sembilan_request/data/remote/api_service.dart';

class ProfileController extends GetxController {
  final _storage = Get.find<FlutterSecureStorage>();
  final ApiService _apiService = Get.find<ApiService>();
  final Rxn<User> user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    loadUserFromCacheAndAPI();
  }

  Future<void> loadUserFromCacheAndAPI() async {
    final userJson = await _storage.read(key: 'user');
    if (userJson == null) return;

    try {
      final cachedUser = User.fromMap(jsonDecode(userJson));
      user.value = cachedUser;
      update();

      final freshUser = await _apiService.getUser(
        token: cachedUser.accessToken,
      );
      if (freshUser != null) {
        user.value = freshUser;
        update();
      }
    } catch (e) {
      log('Error parsing user from cache or fetching fresh data: $e');
    }
  }
}
