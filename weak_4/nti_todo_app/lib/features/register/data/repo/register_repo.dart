import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_todo_app/features/register/data/model/register_model.dart';

class RegisterRepo{
  Future<bool> register({required String name,required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}