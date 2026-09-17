import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/constants/app_strings.dart';
import 'package:shopflow/core/constants/app_text_styles.dart';
import 'package:shopflow/core/widgets/common_app_bar.dart';
import 'package:shopflow/features/cart/providers/cart_provider.dart';
import 'package:shopflow/features/cart/screens/cart_screen.dart';
import 'package:shopflow/features/home/screens/home_screen.dart';
import 'package:shopflow/features/my_products/screens/my_products_listing_screen.dart';
import 'package:shopflow/features/profile/screens/profile_screen.dart';
import 'package:shopflow/features/tab_bar/providers/tab_bar_index_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<TabBarIndexProvider>().setCurrentTabIndex(_tabController.index);
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
    final tabIndexProvider = context.watch<TabBarIndexProvider>();
    int activeIndex = tabIndexProvider.currentTabIndex;

    if (_tabController.index != activeIndex) {
      _tabController.animateTo(activeIndex);
    }

    return Scaffold(
      appBar: const CommonAppBar(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: SizedBox(
            height: 60,
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              controller: _tabController,
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.textSecondary,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: .tab,
              labelStyle: AppTextStyles.labelSmall.copyWith(fontSize: 12),
              tabs: [
                Tab(
                  icon: Icon(
                    activeIndex == 0 ? Icons.home : Icons.home_outlined,
                  ),
                  text: AppStrings.tabBarLabelOne,
                ),
                Tab(
                  icon: Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      final cartItemCount = cartProvider.cartItems.length;

                      return Badge(
                        isLabelVisible: cartItemCount > 0,
                        backgroundColor: AppColors.errorLabel,
                        label: Text(
                          '$cartItemCount',
                          style: AppTextStyles.whiteSmallLabel,
                        ),
                        child: Icon(
                          activeIndex == 1
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                        ),
                      );
                    },
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
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          CartScreen(),
          MyProductsListingScreen(),
          ProfileScreen(),
        ],
      ),
      floatingActionButton: activeIndex == 2
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.addProductScreen);
              },
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.add, color: AppColors.white),
            )
          : const SizedBox(),
    );
  }
}
