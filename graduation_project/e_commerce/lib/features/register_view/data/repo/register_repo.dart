import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper/network/api_helper.dart';
import '../../../../core/helper/network/api_response.dart';
import '../../../../core/helper/network/end_point.dart';


class RegisterRepo{
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, Unit>> register({
    required String phone,
    required String userName,
    required String email,
    required String password,
  })async
  {
    try {
      final Map<String, dynamic> data = {
        'name': userName,
        'email': email,
        'password': password,
        'phone': phone,
      };

      //If image exists, attach as file
      // if (image != null) {
      //   data['image'] = await MultipartFile.fromFile(
      //     image.path,
      //     filename: image.name,
      //   );
      // }
      var response = await apiHelper.postRequest(
          endPoint: EndPoints.register,
          data: data
      );
      if(response.status)
      {
        return right(unit);
      }
      else
      {
        return left(response.message);
      }
    }
    catch (e) {
      print(e);
      return Left(ApiResponse.fromError(e).message);

    }
  }
}