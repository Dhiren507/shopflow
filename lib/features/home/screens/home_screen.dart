import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopflow/core/constants/app_colors.dart';
import 'package:shopflow/core/constants/app_images.dart';
import 'package:shopflow/core/constants/app_routes.dart';
import 'package:shopflow/core/providers/category_provider.dart';
import 'package:shopflow/core/utils/price_calculation_utils.dart';
import 'package:shopflow/features/home/models/product_model.dart';
import 'package:shopflow/features/home/providers/home_screen_provider.dart';

import '../../../core/constants/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<HomeScreenProvider>();

      if (provider.productList.isEmpty) {
        provider.fetchProductsHomeScreen();
      }

      if (context.read<CategoryProvider>().categoryList.isEmpty) {
        context.read<CategoryProvider>().fetchCategories();
      }
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<HomeScreenProvider>().fetchProductsHomeScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLoadingMore = context.select<HomeScreenProvider, bool>((
      provider,
    ) {
      return provider.isLoadingMoreProducts;
    });

    final List<Category> categoryList = context
        .select<CategoryProvider, List<Category>>(
          (value) => value.categoryList,
        );

    final int? selectedCategoryId = context.select<HomeScreenProvider, int?>(
      (provider) => provider.selectedCategoryId,
    );

    return Scaffold(
      backgroundColor: AppColors.bgScreen,
      body: RefreshIndicator(
        onRefresh: () => context
            .read<HomeScreenProvider>()
            .fetchProductsHomeScreen(isRefresh: true),
        color: AppColors.white,
        backgroundColor: AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: [
              // top filtering tiles
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      bool isAllSelected = selectedCategoryId == null;

                      return GestureDetector(
                        onTap: () {
                          context
                              .read<HomeScreenProvider>()
                              .fetchProductsHomeScreen(isAll: true);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isAllSelected
                                ? AppColors.primary
                                : AppColors.white,
                            border: Border.all(
                              color: AppColors.textHint,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            'All',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: isAllSelected
                                  ? AppColors.white
                                  : AppColors.textHint,
                            ),
                          ),
                        ),
                      );
                    }

                    final cat = categoryList[index - 1];
                    bool isSelected = selectedCategoryId == cat.id;
                    return GestureDetector(
                      onTap: () {
                        if (cat.id != null) {
                          context
                              .read<HomeScreenProvider>()
                              .fetchProductsHomeScreen(
                                categoryId: cat.id!,
                              );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.white,
                          border: Border.all(
                            color: AppColors.textHint,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          cat.name ?? '',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: isSelected
                                ? AppColors.white
                                : AppColors.textHint,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: categoryList.length + 1,
                ),
              ),

              const SizedBox(height: 25),

              Consumer<HomeScreenProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading && provider.productList.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (provider.productList.isEmpty) {
                    return Center(child: const Text('No Products Found!!'));
                  }

                  return Expanded(
                    child: AlignedGridView.count(
                      controller: _scrollController,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: provider.productList.length,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        final product = provider.productList[index];
                        final productAmounts =
                            PriceCalculationUtils.calculateProductPrice(
                              product.price ?? 0.0,
                              product.discount ?? 0,
                            );
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.bgCard,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withAlpha(5),
                                offset: const Offset(0, 8),
                                blurRadius: 12,
                                spreadRadius: 0,
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.productDetailScreen,
                                  arguments: product.id,
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                            border: Border.all(
                                              color: AppColors.divider,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  product.images?.first ?? '',
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  Center(child: const Text('Loading...')),
                                              errorWidget:
                                                  (context, url, error) {
                                                    return Icon(
                                                      Icons.hide_image,
                                                      color: AppColors.black,
                                                    );
                                                  },
                                            ),
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            provider.toggleProductLike(index);
                                          },
                                          child: Container(
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: (product.isLiked ?? false)
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: AppColors.darkRed,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .favorite_outline_outlined,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 6),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        product.category?.name ?? '',
                                        style: AppTextStyles.labelSmall,
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        product.title ?? '',
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: AppColors.textPrimary,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      if (product.brandName != null)
                                        Text(
                                          product.brandName ?? '',
                                          style: AppTextStyles.bodySmall
                                              .copyWith(
                                                color: AppColors.textPrimary,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      const SizedBox(height: 4),

                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppImages.ratingStar,
                                            height: 11,
                                            width: 11,
                                            fit: BoxFit.scaleDown,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${product.ratings?.avgRating}',
                                            style: AppTextStyles.bodyMedium
                                                .copyWith(
                                                  color: AppColors.textPrimary,
                                                ),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '(${product.ratings?.totalReviews})',
                                            style: AppTextStyles.labelSmall,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 7),

                                      Wrap(
                                        spacing: 4,
                                        runSpacing: 2,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Text(
                                            "\$${productAmounts['finalPrice']}",
                                            style: AppTextStyles.headingMedium,
                                          ),
                                          if ((product.discount ?? 0) > 0)
                                            Text(
                                              '\$${(product.price ?? 0.0)}',
                                              style: AppTextStyles
                                                  .strikethroughSmall,
                                            ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.errorText,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Text(
                                              '-${product.discount}%',
                                              style:
                                                  AppTextStyles.whiteSmallLabel,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),

              if (isLoadingMore)
                SizedBox(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
