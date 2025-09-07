
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/home_repo.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState>
{
  MenuCubit() : super(MenuInitial());
  static MenuCubit get(context)=> BlocProvider.of(context);




  getMenu()async
  {
    HomeRepo homeRepo = HomeRepo();
    emit(MenuLoading());
    var response = await homeRepo.getMenu();
    response.fold(
            (error)=> emit(MenuError(error: error)),
        (categories)=>emit(MenuSuccess(categories: categories))
    );

  }
  getProducts()async
  {
    HomeRepo homeRepo = HomeRepo();
    emit(MenuLoading());
    var response = await homeRepo.getProducts();
    response.fold(
            (error)=> emit(MenuError(error: error)),
            (products)=>emit(ProductsSuccess(products: products))
    );

  }


  addFavorite(int productId)async
  {
    HomeRepo homeRepo = HomeRepo();
    emit(MenuLoading());
    var response = await homeRepo.addFavorite(productId: productId);
    response.fold(
            (error)=> emit(MenuError(error: error)),
            (unit)=>emit(AddFavoriteSuccess())
    );

  }
}