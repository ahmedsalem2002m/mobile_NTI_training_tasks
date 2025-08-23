import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_todo_app/features/register/data/model/register_model.dart';

import '../../../login/data/model/login_model.dart';

class RegisterRepo{
    Future<Either<String, UserModel>> register({required String name, required String email, required String password})async
    {
      try {
        // Authenticate User
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Add User to Database
        UserModel user = UserModel(id: credential.user!.uid,name: name, email: email);
        await FirebaseFirestore.instance.collection('users')
            .doc(user.id)
            .set(user.toJson());

        return Right(user);
        // TODO: Complete register with storage
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
        return Left(e.code);
      } catch (e) {
        print(e);
        return Left(e.toString());

      }
    }
}