import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app_clean_arch/features/products/domain/entities/product_entity.dart';
import 'package:store_app_clean_arch/features/products/domain/use_cases/get_products_use_case.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<ProductsState> {

  final GetProductsUseCase  getProductsUseCase;
  ProductCubit(this.getProductsUseCase) : super(ProductsInitial());

  Future<void > getproduct() async {
    emit(ProductsLoading());
    try {
      final products = await getProductsUseCase.call();
      emit(ProductsSuccess(products));
    }  catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }

}
