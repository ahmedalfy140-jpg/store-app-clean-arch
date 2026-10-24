import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:store_app_clean_arch/features/auth/data/repositories/auth_repositories_impl.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit( this._authRepositorie) : super(AuthCubitInitial());
  final AuthRepositoriesImpl _authRepositorie;
  Future <void>rgister({required String email , required String password })async{
    emit(AuthCubitLoading());

    try {
      await _authRepositorie.rgister(email: email, password: password);
      emit(AuthCubitSucsess());
    } on FirebaseAuthException catch (e) {
      emit(AuthCubitFailure(e.message ?? 'Registration failed'));
    }catch(e){
      emit(AuthCubitFailure('Something went wrong'));
    }

  }
  Future<void> login({ required String email, required String password})async{
    emit(AuthCubitLoading());

    try {
      await _authRepositorie.login(email: email, password: password);
      emit(AuthCubitSucsess());
    } on FirebaseAuthException catch (e) {
      emit(AuthCubitFailure(e.message??'login failed'));
    }catch(e){
      emit(AuthCubitFailure('Something went wrong'));
    }
  }
}
