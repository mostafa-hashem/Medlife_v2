import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class ShippingMethodRow extends StatefulWidget {
  const ShippingMethodRow({super.key});

  @override
  State<ShippingMethodRow> createState() => _ShippingMethodRowState();
}

class _ShippingMethodRowState extends State<ShippingMethodRow> {
  bool isHomeClicked = false;
  bool isStoreClicked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isStoreClicked = true;
              isHomeClicked = false;
            });
          },
          child: Row(
            children: [
              if (isStoreClicked)
                const Icon(
                  Icons.circle,
                  color: AppColors.primary,
                )
              else
                const Icon(Icons.circle_outlined),
              SizedBox(width: 6.w),
              Text(
                "Pick up from store",
                style: openSans12W600(color: const Color(0xff1A1A1A)),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 77.w,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isStoreClicked = false;
              isHomeClicked = true;
            });
          },
          child: Row(
            children: [
              if (isHomeClicked)
                const Icon(
                  Icons.circle,
                  color: AppColors.primary,
                )
              else
                const Icon(Icons.circle_outlined),
              SizedBox(width: 6.w),
              Text(
                "Home delivery",
                style: openSans12W600(color: const Color(0xff1A1A1A)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
