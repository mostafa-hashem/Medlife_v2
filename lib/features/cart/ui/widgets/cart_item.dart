import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/cart/cubit/cart_cubit.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_order.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_button.dart';

import '../../cubit/cart_state.dart';

class CartItem extends StatefulWidget {
  final CartMedicalEquipment cartMedicalEquipment;

  const CartItem(this.cartMedicalEquipment);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int _quantity = widget.cartMedicalEquipment.quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              widget.cartMedicalEquipment.medicalEquipment.imagesUrls.first,
            ),
            SizedBox(
              width: 9.w,
            ),
            Column(
              children: [
                Text(
                  widget.cartMedicalEquipment.medicalEquipment.title,
                  style: openSans14W400(color: const Color(0xff576A69)),
                ),
                SizedBox(
                  height: 16.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: (_quantity *
                                widget.cartMedicalEquipment.medicalEquipment
                                    .price)
                            .toStringAsFixed(2),
                        style: openSans18W500(
                          color: const Color(0xff1E1E1E).withOpacity(0.8),
                        ),
                      ),
                      TextSpan(
                        text: " \$",
                        style: openSans14W400(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 54.w,
            ),
            DefaultButton(
              function: () {
                setState(() {
                  if (_quantity < 2) {
                    return;
                  }
                  _quantity--;
                  CartCubit.get(context).editCart(
                    CartOrder(
                      medicalEquipmentId:
                          widget.cartMedicalEquipment.medicalEquipment.id,
                      quantity: _quantity,
                    ),
                  );
                });
              },
              icon: Icons.remove_outlined,
              height: 25.h,
              width: 25.w,
              background: Colors.white,
              iconColor: Colors.black,
              borderColor: const Color(0xff000000).withOpacity(0.3),
              iconSize: 20,
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              _quantity.toString(),
              style: openSans16W500(color: Colors.black),
            ),
            SizedBox(
              width: 6.w,
            ),
            DefaultButton(
              function: () {
                setState(() {
                  _quantity++;
                  CartCubit.get(context).editCart(
                    CartOrder(
                      medicalEquipmentId:
                          widget.cartMedicalEquipment.medicalEquipment.id,
                      quantity: _quantity,
                    ),
                  );
                });
              },
              icon: Icons.add_outlined,
              height: 25.h,
              width: 25.w,
              borderColor: const Color(0xff000000).withOpacity(0.3),
              iconSize: 20,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff000000).withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 14,
                  ),
                  Text(
                    "Remove to favorite",
                    style: openSans10W400(color: const Color(0xff979797)),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            BlocListener<CartCubit, CartState>(
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
                print(state);
              },
              child: InkWell(
                onTap: () => CartCubit.get(context).deleteFromCart(
                  widget.cartMedicalEquipment.medicalEquipment.id,
                ),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff000000).withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete_outline,
                        size: 14,
                      ),
                      Text(
                        "Delete from cart",
                        style: openSans10W400(color: const Color(0xff979797)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
