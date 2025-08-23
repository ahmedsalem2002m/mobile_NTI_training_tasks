import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../login/data/model/login_model.dart';

class HomeRepo {

  Future<Either<String, UserModel>> getUser() async
  {
    try {
      var userData = await FirebaseFirestore.instance.collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid).get();
      UserModel user = UserModel.fromJson(userData.data()!);
      return Right(user);
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}