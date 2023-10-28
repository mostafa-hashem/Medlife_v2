import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/cart/cubit/cart_cubit.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';
import 'package:medlife_v2/features/cart/ui/widgets/custom_divider.dart';
import 'package:medlife_v2/features/orders/cubit/orders_cubit.dart';
import 'package:medlife_v2/features/orders/cubit/orders_state.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/features/orders/data/models/order_cost.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_address_container.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_app_bar.dart';
import 'package:medlife_v2/features/payment/ui/widgets/payment_method_card.dart';
import 'package:medlife_v2/features/payment/ui/widgets/shipping_method_row.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/commponents.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/ui/widgets/error_indicator.dart';
import 'package:medlife_v2/ui/widgets/loading_indicator.dart';
import 'package:medlife_v2/ui/widgets/summery_row.dart';
import 'package:medlife_v2/utils/helper_methods.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late final List<CartMedicalEquipment> _medicalEquipments;
  late final List<CartMedicalService> _medicalServices;
  late final double _subtotal;
  final String _paymentMethod = 'Credit Card';
  List<double> summery = [
    2,
    -90,
    5,
    1.5,
  ];

  @override
  void initState() {
    super.initState();
    final cartMedicalEquipments = CartCubit.get(context).cartMedicalEquipments;
    final cartMedicalServices = CartCubit.get(context).cartMedicalServices;
    _subtotal =
        calculateCartTotalPrice(cartMedicalEquipments, cartMedicalServices);
    _medicalEquipments = cartMedicalEquipments;
    _medicalServices = cartMedicalServices;
  }

  @override
  Widget build(BuildContext context) {
    final address = ProfileCubit.get(context).user.address!;
    final phone = ProfileCubit.get(context).user.phoneNumber!;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 43.h,
                ),
                const CustomAppBar(text: "Checkout"),
                SizedBox(
                  height: 37.h,
                ),
                Text(
                  "Shipping Address",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const CustomAddressContainer(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Shipping Method",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                    child: const ShippingMethodRow(),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Payment Method",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const PaymentMethodCard(image: "assets/images/Mastercard.png"),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(image: "assets/images/Visa Card.png"),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(image: "assets/images/Mada.png"),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(
                  image: "assets/images/tabby_installment_mini 1.png",
                  text: 'Tabby',
                ),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(
                  image: "assets/images/tamara.png",
                  text: 'Tamara',
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Order Summery",
                  style: openSans14W500(color: AppColors.primary),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight:
                        CartCubit.get(context).cartMedicalEquipments.length *
                            31.h,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => SummeryRow(
                            text: CartCubit.get(context)
                                .cartMedicalEquipments[index]
                                .medicalEquipment
                                .title,
                            price:
                                '${calculateItemPrice(CartCubit.get(context).cartMedicalEquipments[index].quantity, CartCubit.get(context).cartMedicalEquipments[index].medicalEquipment.price)} SAR',
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 11.h,
                          ),
                          itemCount: CartCubit.get(context)
                              .cartMedicalEquipments
                              .length,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Delivery Fee', price: '+2 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Discount', price: '-90 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Shipping', price: '+5 SAR'),
                SizedBox(
                  height: 11.h,
                ),
                const SummeryRow(text: 'Taxes', price: '+1.5 SAR'),
                SizedBox(
                  height: 16.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 16.h,
                ),
                SummeryRow(
                  text: 'Total',
                  price: '${calculateTotalPrice(
                    price: calculateCartTotalPrice(
                      CartCubit.get(context).cartMedicalEquipments,
                      CartCubit.get(context).cartMedicalServices,
                    ),
                    summery: summery,
                  ).toStringAsFixed(2)} $currency',
                ),
                SizedBox(
                  height: 48.h,
                ),
                BlocListener<OrdersCubit, OrdersState>(
                  listener: (context, state) {
                    if (state is CreateOrderLoading) {
                      const LoadingIndicator();
                      if (state is CreateOrderSuccess) {
                        Navigator.pop(context);
                      } else if (state is CreateOrderError) {
                        const ErrorIndicator();
                      }
                    }
                  },
                  child: DefaultTextButton(
                    function: () => OrdersCubit.get(context)
                        .createOrder(
                          Order(
                            orderCost: OrderCost(
                              subtotal: _subtotal,
                              deliveryFee: 10,
                              discount: 8,
                              taxes: 5,
                            ),
                            cartMedicalEquipments: _medicalEquipments,
                            cartMedicalServices: _medicalServices,
                            address: address,
                            phone: phone,
                            paymentMethod: _paymentMethod,
                            vendorId: _medicalEquipments.first.medicalEquipment.vendorId,
                          ),
                        )
                        .whenComplete(
                          () => Navigator.pushReplacementNamed(
                            context,
                            Routes.successfulPayment,
                          ),
                        ),
                    text: "Check out",
                    textStyle: openSans16W500(color: Colors.white),
                    height: 65.h,
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
