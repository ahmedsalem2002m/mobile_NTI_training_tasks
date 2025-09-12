import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_point.dart';
import '../../../login_view/data/models/login_response_model.dart';
import '../models/category.dart';


class HomeRepo {
  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, UserModel>> getUser()async {
    try{
      var response = await apiHelper.getRequest(
          endPoint: EndPoints.getUserData,
          isProtected: true
      );
      if(response.status)
      {
        var data = response.data as Map<String, dynamic>;
        LoginResponseModel responseModel =
        LoginResponseModel.fromJson(data);
        return right(responseModel.user!);
      }
      else{
        return Left(response.message);
      }
    }
    catch(e)
    {
      return Left(e.toString());
    }
  }
  Future<Either<String, List<CategoryModel>>> getCategory() async {
    try
    {
      var response = await apiHelper.getRequest(
          endPoint: EndPoints.getCategory,
          isProtected: true
      );
      if(response.status)
      {
        MenuResponseModel category = MenuResponseModel.fromJson(response.data as Map<String, dynamic>);
        return Right(category.categories!);
      }
      else
      {
        return Left(response.message);
      }
    }
    catch(e)
    {
      return Left(ApiResponse.fromError(e).message);
    }
  }
  Future<Either<String, ProductModel>> getProducts() async {
    try
    {
      var response = await apiHelper.getRequest(
          endPoint: EndPoints.getProducts,
          isProtected: true
      );
      if(response.status)
      {
        ProductModel products = ProductModel.fromJson(response.data as Map<String, dynamic>);
        return Right(products);
      }
      else
      {
        return Left(response.message);
      }
    }
    catch(e)
    {
      return Left(ApiResponse.fromError(e).message);
    }
  }


  Future<Either<String, Unit>> addFavorite({


    required int productId})
  async{
    try {
      var response = await apiHelper.postRequest(
          endPoint: EndPoints.addToFavorite,
          isProtected: true,
          data: {
            "product_id":productId
          }
      );
      if(response.status)
      {
        return Right(unit);
      }
      else{
        return Left(response.message);
      }

    }
    catch (e) {
      return Left(ApiResponse.fromError(e).message);

    }


  }

// Future<Either<String, UserModel>> getUser() async
// {
//   try {
//     var userData = await FirebaseFirestore.instance.collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid).get();
//     UserModel user = UserModel.fromJson(userData.data()!);
//     return Right(user);
//   }
//   catch (e) {
//     return Left(e.toString());
//   }
// }
}