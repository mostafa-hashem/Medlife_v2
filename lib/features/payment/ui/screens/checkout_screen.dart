import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/cart/cubit/cart_cubit.dart';
import 'package:medlife_v2/features/cart/data/models/cart_blood_bank.dart';
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
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/ui/widgets/error_indicator.dart';
import 'package:medlife_v2/ui/widgets/loading_indicator.dart';
import 'package:medlife_v2/ui/widgets/summery_row.dart';
import 'package:medlife_v2/utils/constants.dart';
import 'package:medlife_v2/utils/helper_methods.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late final List<CartMedicalEquipment> _cartMedicalEquipments;
  late final List<CartMedicalService> _cartMedicalServices;
  late final List<CartBloodBank> _cartBloodBanks;
  late final double _subtotal;
  final double _shipping = 20;
  late final double _vat;
  late final double _total;
  final String _paymentMethod = 'Cash';

  @override
  void initState() {
    super.initState();
    _cartMedicalEquipments = CartCubit.get(context).cartMedicalEquipments;
    _cartMedicalServices = CartCubit.get(context).cartMedicalServices;
    _cartBloodBanks = CartCubit.get(context).cartBloodBanks;
    _subtotal = calculateCartSubtotal(
      _cartMedicalEquipments,
      _cartMedicalServices,
      _cartBloodBanks,
    );
    _vat = calculateVAT(_subtotal, _shipping);
    _total = calculateTotal(_subtotal, _shipping, _vat);
  }

  @override
  Widget build(BuildContext context) {
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
                const PaymentMethodCard(
                  image: "assets/images/Cash.png",
                  text: "Cash",
                  color: AppColors.primary,
                ),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(
                  image: "assets/images/mastercard.png",
                  text: "Mastercard",
                ),
                SizedBox(
                  height: 12.h,
                ),
                const PaymentMethodCard(
                  image: "assets/images/visa.png",
                  text: "Visa",
                ),
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
                    maxHeight: _cartMedicalEquipments.isNotEmpty
                        ? _cartMedicalEquipments.length * 31.h
                        : _cartMedicalServices.isNotEmpty
                            ? _cartMedicalServices.length * 31.h
                            : _cartBloodBanks.length * 31.h,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            if (_cartMedicalEquipments.isNotEmpty) {
                              return SummeryRow(
                                text: _cartMedicalEquipments[index]
                                    .medicalEquipment
                                    .title,
                                price:
                                    '${calculateItemPrice(_cartMedicalEquipments[index].quantity, _cartMedicalEquipments[index].medicalEquipment.price)} $currency',
                              );
                            } else if (_cartMedicalServices.isNotEmpty) {
                              return SummeryRow(
                                text: _cartMedicalServices[index]
                                    .medicalService
                                    .title,
                                price:
                                    '${calculateItemPrice(_cartMedicalServices[index].quantity, _cartMedicalServices[index].medicalService.price)} $currency',
                              );
                            } else {
                              return SummeryRow(
                                text: _cartBloodBanks[index].bloodBank.title,
                                price:
                                    '${calculateItemPrice(_cartBloodBanks[index].quantity, _cartBloodBanks[index].bloodBank.price)} $currency',
                              );
                            }
                          },
                          separatorBuilder: (_, __) => SizedBox(height: 11.h),
                          itemCount: _cartMedicalEquipments.isNotEmpty
                              ? _cartMedicalEquipments.length
                              : _cartMedicalServices.isNotEmpty
                                  ? _cartMedicalServices.length
                                  : _cartBloodBanks.length,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 11.h),
                SummeryRow(
                  text: 'Shipping',
                  price: '+$_shipping $currency',
                ),
                SizedBox(height: 11.h),
                SummeryRow(
                  text: 'VAT',
                  price: '+${_vat.toStringAsFixed(2)} $currency',
                ),
                SizedBox(height: 16.h),
                const CustomDivider(),
                SizedBox(height: 16.h),
                SummeryRow(
                  text: 'Total',
                  price: '$_total',
                ),
                SizedBox(height: 48.h),
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
                    function: () {
                      final order = Order(
                        cost: OrderCost(
                          subtotal: _subtotal,
                          shipping: _shipping,
                        ),
                        cartMedicalEquipments: _cartMedicalEquipments,
                        cartMedicalServices: _cartMedicalServices,
                        cartBloodBanks: _cartBloodBanks,
                        buyer: ProfileCubit.get(context).user,
                        paymentMethod: _paymentMethod,
                        vendorId: _cartMedicalEquipments
                            .first.medicalEquipment.vendorId,
                      );
                      OrdersCubit.get(context).createOrder(order).whenComplete(
                            () => Navigator.pushReplacementNamed(
                              context,
                              Routes.successfulPayment,
                              arguments: order,
                            ),
                          );
                    },
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
