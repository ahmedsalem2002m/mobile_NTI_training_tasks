import '../data/models/category.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final String error;

  CategoryError({required this.error});
}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccess({required this.categories});
}

class CategoryProductsSuccess extends CategoryState {
  final List<ProductModel> products;
  CategoryProductsSuccess({required this.products});
}

// class ProductsSuccess extends CategoryState {
//   final ProductModel products;
//
//   ProductsSuccess({required this.products});
// }
// class AddFavoriteSuccess extends CategoryState {
//
// }
