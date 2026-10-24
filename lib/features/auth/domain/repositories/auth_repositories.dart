import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositories {
  Future <UserCredential> rgister ({required String email , required String password});

  Future <UserCredential>login({required String email , required String password});
  
  Future <void>logout();
}



