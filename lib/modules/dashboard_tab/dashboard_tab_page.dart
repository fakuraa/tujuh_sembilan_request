import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tujuh_sembilan_request/modules/dashboard_tab/dashboard_tab_controller.dart';
import 'package:tujuh_sembilan_request/modules/home/home_page.dart';
import 'package:tujuh_sembilan_request/modules/profile/profile_page.dart';

class DashboardTabPage extends StatefulWidget {
  static const route = "/dashboard";
  const DashboardTabPage({super.key});

  @override
  State<DashboardTabPage> createState() => _DashboardTabPageState();
}

class _DashboardTabPageState extends State<DashboardTabPage> {
  final List<BottomNavigationBarItem> navItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardTabController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedTab,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).colorScheme.surface,
            items: navItems,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Theme.of(context).primaryColor,
            ),
            unselectedLabelStyle: Theme.of(context).textTheme.bodySmall
                ?.copyWith(fontSize: 12, color: Colors.blueGrey),
            onTap: (value) {
              controller.setSelectedTab(value);
            },
          ),
          body: DefaultTabController(
            animationDuration: const Duration(milliseconds: 300),
            length: 5,
            child: [HomePage(), ProfilePage()][controller.selectedTab],
          ),
        );
      },
    );
  }
}
