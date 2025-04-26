import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:tujuh_sembilan_request/theme/app_theme.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  static const route = "/login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/login_banner.svg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: FormBuilder(
                          key: controller.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                "Welcome back!",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Log in with data that has been register.",
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: AppColor.subHintColor),
                              ),
                              const SizedBox(height: 32),
                              FormBuilderTextField(
                                name: 'username',
                                enabled: !controller.isLoading.value,
                                decoration: InputDecoration(
                                  hintText: 'username',
                                  prefixIcon: Icon(
                                    Icons.email_rounded,
                                    color: AppColor.primary.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  // FormBuilderValidators.email(),
                                ]),
                              ),
                              const SizedBox(height: 16),
                              FormBuilderTextField(
                                name: 'password',
                                enabled: !controller.isLoading.value,
                                obscureText: controller.obsecure.value,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock_rounded,
                                    color: AppColor.primary.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: controller.setObsecure,
                                    child: Icon(
                                      controller.obsecure.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: AppColor.primaryDark.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(6),
                                ]),
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  child: const Text("Forgot password"),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(height: 16),
                              controller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.primary,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (controller.formKey.currentState
                                                ?.saveAndValidate() ??
                                            false) {
                                          controller.login();
                                        }
                                      },
                                      child: const Text("Login"),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
