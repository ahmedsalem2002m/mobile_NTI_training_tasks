
import 'package:e_commerce/features/product_details_view/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_view/data/models/category.dart';

class PCubit extends Cubit<PState> {
  PCubit() : super(PInitial());

  static PCubit get(context) => BlocProvider.of(context);

  bool isFavorite = false;

  List<ProductModel> cart = [];

  void addFavorite(int productId) {
    try {
      isFavorite = true;
      emit(AddFavoriteSuccess());
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  void addToCart(ProductModel product, int quantity) {
    try {
      for (int i = 0; i < quantity; i++) {
        cart.add(product);
      }
      emit(AddToCartSuccess());
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }}