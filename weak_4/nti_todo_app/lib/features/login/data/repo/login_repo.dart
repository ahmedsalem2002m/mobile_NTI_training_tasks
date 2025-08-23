import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_todo_app/features/login/data/model/login_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class LoginRepo{
  Future<Either<String, UserModel>> login({required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      var userData = await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).get();
      UserModel user = UserModel.fromJson(userData.data()!);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Left(e.code);
    }
    catch (e) {
      print(e);
      return Left(e.toString());
    }


  }



}