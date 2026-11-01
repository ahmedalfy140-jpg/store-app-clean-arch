part of 'categorey_cubit.dart';

@immutable
sealed class CategoreyState {}

final class CategoreyInitial extends CategoreyState {}
final class CategoreyLoading extends CategoreyState {}
final class CategoreySuccess extends CategoreyState {
  final List<CategoryEntitey> categories;

  CategoreySuccess(this.categories);
}
final class CategoreyFailure extends CategoreyState {
   final String message;

  CategoreyFailure(this.message);
}
