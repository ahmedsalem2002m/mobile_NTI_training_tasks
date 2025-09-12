import 'package:e_commerce/features/home_view/views/widgets/category_item.dart';
import 'package:e_commerce/features/home_view/views/widgets/reco_view.dart';
import 'package:e_commerce/features/home_view/views/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paddings.dart';
import '../../../core/widgets/default_text_form_field.dart';
import '../cubit/category_cubit.dart';
import '../cubit/category_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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

          return RefreshIndicator(
            onRefresh: () async {
              await cubit.getCategory();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: AppPaddings.appPaddingPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6.h),
                    DefaultTextFormField(
                      prefixIcon: Icon(Icons.search),
                      controller: TextEditingController(),
                      hintText: 'Search any Product',
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "All Featured",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    if (state is CategoryLoading)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (categories.isEmpty)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Text(
                            "No Category",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return CategoryItem(
                              onTap: () {
                                cubit.selectCategory(category);
                              },
                              categoryModel: category,
                            );
                          },
                        ),
                      ),
                    SizedBox(height: 12.h),
                    CustomImageSlider(),
                    SizedBox(height: 12.h),
                    Text(
                      "Recommended",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    if (state is CategoryProductsSuccess)
                      state.products.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: Text(
                                  "No Products",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            )
                          : ProductGridView(products: state.products)
                    else
                      const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
