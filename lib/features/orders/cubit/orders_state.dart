abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class CreateOrderLoading extends OrdersState {}

class CreateOrderSuccess extends OrdersState {}

class CreateOrderError extends OrdersState {
  final String message;

  CreateOrderError(this.message);
}
