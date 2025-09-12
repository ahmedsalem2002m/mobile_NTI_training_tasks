
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/category.dart';
import '../data/repo/home_repo.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState>
{
  CategoryCubit() : super(CategoryInitial());
  static CategoryCubit get(context)=> BlocProvider.of(context);
  List<ProductModel> selectedCategoryProducts = [];
  List<CategoryModel> categories = [];




  getCategory() async {
    HomeRepo homeRepo = HomeRepo();
    emit(CategoryLoading());

    var response = await homeRepo.getCategory();
    response.fold(
          (error) => emit(CategoryError(error: error)),
          (categoriesFetched) {
            categories = categoriesFetched;
        emit(CategorySuccess(categories: categories));
        if (categories.isNotEmpty) {
          selectCategory(categories[0]);
        }
      },
    );
  }



  selectCategory(CategoryModel category) {
    selectedCategoryProducts = category.products ?? [];
    emit(CategoryProductsSuccess(products: selectedCategoryProducts));
  }

// getProducts()async
  // {
  //   HomeRepo homeRepo = HomeRepo();
  //   emit(MenuLoading());
  //   var response = await homeRepo.getProducts();
  //   response.fold(
  //           (error)=> emit(MenuError(error: error)),
  //           (products)=>emit(ProductsSuccess(products: products))
  //   );
  //
  // }
  //
  //
  // addFavorite(int productId)async
  // {
  //   HomeRepo homeRepo = HomeRepo();
  //   emit(MenuLoading());
  //   var response = await homeRepo.addFavorite(productId: productId);
  //   response.fold(
  //           (error)=> emit(MenuError(error: error)),
  //           (unit)=>emit(AddFavoriteSuccess())
  //   );
  //
  // }
}