import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
  Future<UserCredential> rgister ({ required String email,required String password})async{
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }


   Future<UserCredential> login ({ required String email,required String password})async{
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

    Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}