import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tujuh_sembilan_request/main_controller.dart';
import 'package:tujuh_sembilan_request/modules/profile/profile_controller.dart';
import 'package:tujuh_sembilan_request/modules/profile/widgets/profile_menu_list_tile.dart';
import 'package:tujuh_sembilan_request/modules/profile/widgets/scrollview_with_expanded.dart';
import 'package:tujuh_sembilan_request/modules/profile/widgets/top_portion.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 16.0;
    const Color errorColor = Color(0xFFEA5B5B);
    return GetBuilder<ProfileController>(
      init: Get.find<ProfileController>(),
      builder: (controller) {
        return Scaffold(
          body: ScrollViewWithExpanded(
            children: [
              Expanded(flex: 1, child: TopPortion(user: controller.user.value)),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    ProfileMenuListTile(
                      text: "Returns",
                      svgSrc: "assets/icons/Return.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Wishlist",
                      svgSrc: "assets/icons/Wishlist.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Addresses",
                      svgSrc: "assets/icons/Address.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Payment",
                      svgSrc: "assets/icons/card.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Wallet",
                      svgSrc: "assets/icons/Wallet.svg",
                      press: () {},
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Personalization",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ProfileMenuListTile(
                      text: "Preferences",
                      svgSrc: "assets/icons/Preferences.svg",
                      press: () {},
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Settings",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ProfileMenuListTile(
                      text: "Language",
                      svgSrc: "assets/icons/Language.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "Location",
                      svgSrc: "assets/icons/Location.svg",
                      press: () {},
                    ),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Help & Support",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ProfileMenuListTile(
                      text: "Get Help",
                      svgSrc: "assets/icons/Help.svg",
                      press: () {},
                    ),
                    ProfileMenuListTile(
                      text: "FAQ",
                      svgSrc: "assets/icons/FAQ.svg",
                      press: () {},
                      isShowDivider: false,
                    ),
                    const SizedBox(height: defaultPadding),

                    // Log Out
                    ListTile(
                      onTap: () {
                        Get.find<MainController>().logout();
                      },
                      minLeadingWidth: 24,
                      leading: SvgPicture.asset(
                        "assets/icons/Logout.svg",
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          errorColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: const Text(
                        "Log Out",
                        style: TextStyle(
                          color: errorColor,
                          fontSize: 14,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
