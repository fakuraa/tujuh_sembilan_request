import 'dart:math';

import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:tujuh_sembilan_request/modules/home/model/carousel_data.dart';
import 'package:tujuh_sembilan_request/modules/home/widgets/carousel_widget.dart';
import 'package:tujuh_sembilan_request/modules/home/widgets/custom_appbar.dart';
import 'package:tujuh_sembilan_request/modules/home/widgets/ecommerce_item.dart';
import 'package:tujuh_sembilan_request/theme/app_theme.dart';

final List<CarouselData> carouselDatas = [
  CarouselData(
    title: "Get your special sale up to 50%",
    actionText: "Show Now!",
    color: Colors.purple,
    image: "assets/images/hoodie.png",
  ),
  CarouselData(
    title: "Get your special sale up to 50%",
    actionText: "Show Now!",
    color: Colors.amber,
    image: "assets/images/jeans.png",
  ),
  CarouselData(
    title: "Get your special sale up to 50%",
    actionText: "Show Now!",
    color: Colors.blue,
    image: "assets/images/keyboard.png",
  ),
  CarouselData(
    title: "Get your special sale up to 50%",
    actionText: "Show Now!",
    color: Colors.red,
    image: "assets/images/shoes.png",
  ),
];

final List<String> tabs = [
  "All",
  "Fashion",
  "Sport",
  "Lifestyle",
  "Electronics",
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: const CustomAppBar(),

            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselWidget(datas: carouselDatas),

                      Row(
                        children: [
                          Icon(
                            Icons.category_outlined,
                            color: AppColor.primary,
                          ),
                          Text(
                            "Categories",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ).marginSymmetric(horizontal: 16),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        crossAxisCount: 4,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 0,
                        childAspectRatio: 1,
                        children: [
                          _buildCategoryItem(Icons.phone_iphone, "Phones"),
                          _buildCategoryItem(Icons.laptop_mac, "Laptops"),
                          _buildCategoryItem(Icons.watch_outlined, "Watches"),
                          _buildCategoryItem(
                            Icons.chair_alt_outlined,
                            "Furniture",
                          ),
                          _buildCategoryItem(Icons.sports_esports, "Gaming"),
                          _buildCategoryItem(
                            Icons.kitchen_outlined,
                            "Appliances",
                          ),
                          _buildCategoryItem(Icons.headphones, "Audio"),
                          _buildCategoryItem(Icons.more_horiz, "More"),
                        ],
                      ),
                    ],
                  ),
                ),

                SliverAppBar(
                  floating: true,
                  pinned: true,
                  snap: true,
                  toolbarHeight: 30,

                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.symmetric(vertical: 0),
                    title: TabBar(
                      dividerColor: Colors.transparent,
                      isScrollable: true,
                      padding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onSurface,
                      labelStyle: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.bodyMedium,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Theme.of(context).primaryColor,
                      indicatorAnimation: TabIndicatorAnimation.elastic,

                      tabs:
                          tabs
                              .asMap()
                              .entries
                              .map(
                                (entry) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                  ),
                                  child: Text(entry.value),
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: AutoScaleTabBarView(
                    children: List.generate(
                      tabs.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GridView.builder(
                          itemCount: 5 + Random().nextInt(5 - 1),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 1.5 / 2.6,
                              ),
                          itemBuilder:
                              (ctx, idx) => EcommerceItem(
                                isDiscount: idx % 2 == 0,
                                onPresed: () {},
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade100,
          ),
          child: Icon(icon, size: 24, color: Colors.black87),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
