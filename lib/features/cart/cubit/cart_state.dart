abstract class CartState {}

class CartInitial extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {
  final String message;

  AddToCartError(this.message);
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  final String message;

  GetCartError(this.message);
}

class EditCartLoading extends CartState {}

class EditCartSuccess extends CartState {}

class EditCartError extends CartState {
  final String message;

  EditCartError(this.message);
}

class DeleteCartLoading extends CartState {}

class DeleteCartSuccess extends CartState {}

class DeleteCartError extends CartState {
  final String message;

  DeleteCartError(this.message);
}
