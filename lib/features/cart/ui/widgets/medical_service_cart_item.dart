import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/cart/cubit/cart_cubit.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';
import 'package:medlife_v2/features/cart/data/models/medical_service_cart_order.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_button.dart';
import 'package:medlife_v2/utils/constants.dart';

class MedicalServiceCartItem extends StatefulWidget {
  final CartMedicalService cartMedicalService;

  const MedicalServiceCartItem(this.cartMedicalService);

  @override
  State<MedicalServiceCartItem> createState() => _MedicalServiceCartItemState();
}

class _MedicalServiceCartItemState extends State<MedicalServiceCartItem> {
  late int _quantity = widget.cartMedicalService.quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: 100.w,
                minHeight: 100.h,
                maxHeight: 100.h,
                maxWidth: 100.w,
              ),
              child: Image.asset(
                widget.cartMedicalService.medicalService.imagesUrls.first,
              ),
            ),
            SizedBox(
              width: 7.w,
            ),
            Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                    minWidth: 130.w,
                    maxWidth: 140.w,
                  ),
                  child: Center(
                    child: Text(
                      widget.cartMedicalService.medicalService.title,
                      style: openSans14W400(color: const Color(0xff576A69)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: (_quantity *
                                widget.cartMedicalService.medicalService.price)
                            .toStringAsFixed(2),
                        style: openSans14W500(
                          color: const Color(0xff1E1E1E).withOpacity(0.8),
                        ),
                      ),
                      TextSpan(
                        text: " $currency",
                        style: openSans14W400(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40.w,
            ),
            DefaultButton(
              function: () {
                setState(() {
                  if (_quantity < 2) {
                    return;
                  }
                  _quantity--;
                  CartCubit.get(context).editMedicalServicesCart(
                    MedicalServiceCartOrder(
                      medicalServiceId:
                          widget.cartMedicalService.medicalService.id,
                      quantity: _quantity,
                      providerId:
                          widget.cartMedicalService.medicalService.providerId,
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
                  CartCubit.get(context).editMedicalServicesCart(
                    MedicalServiceCartOrder(
                      medicalServiceId:
                          widget.cartMedicalService.medicalService.id,
                      quantity: _quantity,
                      providerId:
                          widget.cartMedicalService.medicalService.providerId,
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
            InkWell(
              onTap: () => CartCubit.get(context).deleteFromMedicalServicesCart(
                widget.cartMedicalService.medicalService.id,
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
          ],
        ),
      ],
    );
  }
}
