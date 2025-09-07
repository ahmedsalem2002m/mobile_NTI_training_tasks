

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_point.dart';
import '../model/login_response_model.dart';

class LoginRepo{
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, UserModel>> login({


    required String email, required String password})
  async{
    try {
      var response = await apiHelper.postRequest(
          endPoint: EndPoints.login,
          data: {
            'email': email,
            'password': password
          }
      );
      if(response.status)
      {
        LoginResponseModel loginResponseModel
        = LoginResponseModel.fromJson(response.data as Map<String, dynamic>);

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('access_token', loginResponseModel.accessToken!);
        sharedPreferences.setString('refresh_token', loginResponseModel.refreshToken!);

        return Right(loginResponseModel.user!);
      }
      else{
        return Left(response.message);
      }

    }
    catch (e) {
      print(e);
      return Left(ApiResponse.fromError(e).message);

    }


  }
  // Future<Either<String, UserModel>> login({required String email, required String password}) async{
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: email,
  //         password: password
  //     );
  //     var userData = await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).get();
  //     UserModel user = UserModel.fromJson(userData.data()!);
  //     return Right(user);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //     return Left(e.code);
  //   }
  //   catch (e) {
  //     print(e);
  //     return Left(e.toString());
  //   }


  }



