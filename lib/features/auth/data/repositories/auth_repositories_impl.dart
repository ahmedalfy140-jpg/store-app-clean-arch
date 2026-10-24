import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app_clean_arch/features/auth/data/services/firebase_auth_service.dart';
import 'package:store_app_clean_arch/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final FirebaseAuthService _authService;

  AuthRepositoriesImpl(this._authService);
  @override
  Future<UserCredential> login({required String email, required String password}) {
    return _authService.rgister(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return _authService.logout();
   
  }

  @override
  Future<UserCredential> rgister({required String email, required String password}) {
   return _authService.login(email: email, password: password);
  }
}