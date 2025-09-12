import 'package:e_commerce/core/helper/app_navigator.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/default_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_view/data/models/category.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  bool isFavorite = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PCubit(),
      child: BlocConsumer<PCubit, PState>(
        listener: (context, state) {
          if (state is AddFavoriteSuccess) {
            setState(() {
              isFavorite = true;
            });
          } else if (state is AddToCartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product added to cart')),
            );
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          var cubit = PCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.textColorPrimary,
              title: Text(
                'Product',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  AppNavigator.goBack(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(
                      widget.product.imagePath ?? "https://via.placeholder.com/400",
                      width: double.infinity,
                      height: 400.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name ?? "No Name",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          cubit.addFavorite(widget.product.id ?? 0);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.product.description ?? "No description",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.product.price} \$',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorButton),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                              icon: Icon(Icons.remove, color: Colors.pink)),
                          Text('$quantity', style: TextStyle(fontSize: 16.sp)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: Icon(Icons.add, color: Colors.pink)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    width: double.infinity,
                    height: 55,
                    color: AppColors.colorButton,
                    child: DefaultBtn(
                      titleButton: "Add to Cart",
                      onPressed: () {
                        cubit.addToCart(widget.product, quantity);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
