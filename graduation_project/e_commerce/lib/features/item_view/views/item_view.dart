import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paddings.dart';
import '../../home_view/views/widgets/category_item.dart';
import '../../home_view/views/widgets/reco_view.dart';
import '../../home_view/cubit/category_cubit.dart';
import '../../home_view/cubit/category_state.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColorPrimary,
        centerTitle: true,
        title: IconButton(
          onPressed: null,
          icon: SvgPicture.asset(AppAssets.splashIcon, height: 39.h),
        ),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          final cubit = CategoryCubit.get(context);
          final categories = cubit.categories;
          final selectedProducts = cubit.selectedCategoryProducts;

          return SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.appPaddingPrimary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  Text(
                    "All Featured",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  SizedBox(height: 16.h),
                  if (state is CategoryLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (categories.isEmpty)
                    const Center(child: Text("No Categories"))
                  else
                    SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return CategoryItem(
                            categoryModel: category,
                            onTap: () {
                              cubit.selectCategory(category);
                            },
                          );
                        },
                      ),
                    ),
                  SizedBox(height: 12.h),
                  Text(
                    "Products",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black),
                  ),
                  SizedBox(height: 12.h),
                  if (state is CategoryProductsSuccess)
                    selectedProducts.isEmpty
                        ? Center(
                      child: Text(
                        "No Products",
                        style: TextStyle(
                            fontSize: 14.sp, color: Colors.grey),
                      ),
                    )
                        : ProductGridView(products: selectedProducts)
                  else
                    const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
