abstract class ProductDetailsStates {}

class ProductDetailsInitial extends ProductDetailsStates {}

class ProductDetailsLoading extends ProductDetailsStates {}

class ProductDetailsSuccess extends ProductDetailsStates {}

class ProductDetailsFailure extends ProductDetailsStates {
  final String error;

  ProductDetailsFailure(this.error);
}
