abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class CreateOrderLoading extends OrdersState {}

class CreateOrderSuccess extends OrdersState {}

class CreateOrderError extends OrdersState {
  final String message;

  CreateOrderError(this.message);
}

class GetOrdersLoading extends OrdersState {}

class GetOrdersSuccess extends OrdersState {}

class GetOrdersError extends OrdersState {
  final String message;

  GetOrdersError(this.message);
}

class GetPendingOrdersLoading extends OrdersState {}

class GetPendingOrdersSuccess extends OrdersState {}

class GetPendingOrdersError extends OrdersState {
  final String message;

  GetPendingOrdersError(this.message);
}

class GetAcceptOrderLoading extends OrdersState {}

class GetAcceptOrderSuccess extends OrdersState {}

class GetAcceptOrderError extends OrdersState {
  final String message;

  GetAcceptOrderError(this.message);
}

class GetDeliveredOrdersLoading extends OrdersState {}

class GetDeliveredOrdersSuccess extends OrdersState {}

class GetDeliveredOrdersError extends OrdersState {
  final String message;

  GetDeliveredOrdersError(this.message);
}

class OrderCanceledLoading extends OrdersState {}

class OrderCanceledSuccess extends OrdersState {}

class OrderCanceledError extends OrdersState {
  final String message;

  OrderCanceledError(this.message);
}

class CancelOrderLoading extends OrdersState {}

class CancelOrderSuccess extends OrdersState {}

class CancelOrderError extends OrdersState {
  final String message;

  CancelOrderError(this.message);
}
