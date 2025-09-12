import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product_details_view/views/product_details_view.dart';
import '../../data/models/category.dart'; //
class ProductGridView extends StatefulWidget {
  final List<ProductModel> products;

  const ProductGridView({super.key, required this.products});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 0.48,
      ),
      itemBuilder: (context, index) {
        final product = widget.products[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailsView(product: product),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.r,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  child: Image.network(
                    product.imagePath ?? '',
                    height: 230.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? '',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        product.description ?? '',
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '${product.price?.toStringAsFixed(2) ?? '0.00'} \$',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: List.generate(5, (index) {
                          double rating = product.rating ?? 0;

                          if (index < rating.floor()) {
                            return Icon(Icons.star, color: Colors.amber, size: 14.sp);
                          } else if (index < rating && rating - index >= 0.5) {
                            return Icon(Icons.star_half, color: Colors.amber, size: 14.sp);
                          } else {
                            return Icon(Icons.star_border, color: Colors.grey[300], size: 14.sp);
                          }
                        }),
                      ),
                    ],
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
