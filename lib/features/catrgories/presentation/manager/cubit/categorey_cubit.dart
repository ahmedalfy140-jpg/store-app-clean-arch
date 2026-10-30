import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:store_app_clean_arch/features/catrgories/domain/entities/category_entitey.dart';

import 'package:store_app_clean_arch/features/catrgories/domain/use_case/get_categoris_use_case.dart';

part 'categorey_state.dart';

class CategoreyCubit extends Cubit<CategoreyState> {
  CategoreyCubit(this.getCategorisUseCase) : super(CategoreyInitial());
  final GetCategorisUseCase getCategorisUseCase;
 Future <void> getCategory()async{
  emit(CategoreyLoading());
  try {
    final categories =await getCategorisUseCase();
    
    emit(CategoreySuccess(categories));
  } on Exception catch (e) {
    emit(CategoreyFailure(e.toString()));
  }
 }
  
}
