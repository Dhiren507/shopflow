import 'package:flutter/material.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/widgets/common_app_bar.dart';
import 'package:shopflow/features/profile/profile_screen.dart';
import 'package:shopflow/features/shop/screens/cart_screen.dart';
import 'package:shopflow/features/shop/screens/home_screen.dart';
import 'package:shopflow/features/shop/screens/my_products_listing_screen.dart';

class CommonBaseScreen extends StatefulWidget {
  const CommonBaseScreen({super.key});

  @override
  State<CommonBaseScreen> createState() => _CommonBaseScreenState();
}

class _CommonBaseScreenState extends State<CommonBaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int activeIndex = _tabController.index;
    return Scaffold(
      appBar: CommonAppBar(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: SizedBox(
            height: 60,
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.subheadingDarkGreyText,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: .tab,
              tabs: [
                Tab(
                  icon: Icon(activeIndex == 0 ? Icons.home : Icons.home_outlined),
                  text: AppStrings.tabBarLabelOne,
                ),
                Tab(
                  icon: Icon(
                    activeIndex == 1
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                  ),
                  text: AppStrings.tabBarLabelTwo,
                ),
                Tab(
                  icon: Icon(
                    activeIndex == 2
                        ? Icons.inventory_2
                        : Icons.inventory_2_outlined,
                  ),
                  text: AppStrings.tabBarLabelThree,
                ),
                Tab(
                  icon: Icon(
                    activeIndex == 3 ? Icons.person : Icons.person_outline,
                  ),
                  text: AppStrings.tabBarLabelFour,
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          CartScreen(),
          MyProductsListingScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
