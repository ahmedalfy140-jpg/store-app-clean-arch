import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit   extends Cubit<int> {

  BottomNavCubit() : super (0);
  void changeTap (int index){
    emit(index);
  }
}