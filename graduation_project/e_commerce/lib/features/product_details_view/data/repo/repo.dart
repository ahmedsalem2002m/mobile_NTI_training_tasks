import 'package:dartz/dartz.dart';
import '../../../../core/helper/network/api_helper.dart';
import '../../../../core/helper/network/api_response.dart';
import '../../../../core/helper/network/end_point.dart';


class Repo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, Unit>> addFavorite({required int productId}) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.addToFavorite,
        isProtected: true,
        data: {"product_id": productId},
      );

      if (response.status) {
        return Right(unit);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
