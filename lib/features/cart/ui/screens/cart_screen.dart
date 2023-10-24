import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/cart/cubit/cart_cubit.dart';
import 'package:medlife_v2/features/cart/cubit/cart_state.dart';
import 'package:medlife_v2/features/cart/ui/widgets/cart_item.dart';
import 'package:medlife_v2/features/cart/ui/widgets/custom_divider.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/commponents.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';
import 'package:medlife_v2/ui/widgets/error_indicator.dart';
import 'package:medlife_v2/ui/widgets/loading_indicator.dart';
import 'package:medlife_v2/ui/widgets/summery_row.dart';
import 'package:medlife_v2/utils/helper_methods.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).getCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (_, state) {
        if (state is DeleteCartLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Successfully Deleted",
                style: TextStyle(fontSize: 15),
              ),
              backgroundColor: AppColors.primary,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is GetCartLoading) {
          return const LoadingIndicator();
        } else if (state is GetCartError) {
          return const ErrorIndicator();
        } else {
          return CartCubit.get(context).cartMedicalEquipments.isEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 64.h, left: 21.w, right: 21.w),
                  child: Column(
                    children: [
                      Align(
                        child: Text(
                          "Cart",
                          style: openSans16W500(color: const Color(0xff1E1E1E)),
                        ),
                      ),
                      SizedBox(
                        height: 78.h,
                      ),
                      Image.asset("assets/images/emptyCart.png"),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 39.h, left: 21.w, right: 21.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Text(
                          "Cart",
                          style: openSans16W500(color: const Color(0xff1E1E1E)),
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final cartMedicalEquipment = CartCubit.get(context)
                                .cartMedicalEquipments[index];
                            return CartItem(
                              cartMedicalEquipment,
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 23.h,
                          ),
                          itemCount: CartCubit.get(context)
                              .cartMedicalEquipments
                              .length,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const CustomDivider(),
                      SizedBox(
                        height: 16.h,
                      ),
                      SummeryRow(
                        text: 'Total',
                        price: '${calculateProductsPrice(
                          CartCubit.get(context).cartMedicalEquipments,
                        ).toStringAsFixed(2)} $currency',
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      DefaultTextButton(
                        function: () =>
                            Navigator.pushNamed(context, Routes.paymentMethod),
                        text: "Place order",
                        textStyle: openSans16W500(color: Colors.white),
                        height: 65.h,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 120.h,
                      ),
                    ],
                  ),
                );
        }
      },
    );
  }
}
