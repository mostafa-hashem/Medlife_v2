import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/payment/ui/widgets/custom_insurance_countainer.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/default_text_button.dart';

class InsurancePaymentScreen extends StatefulWidget {
  const InsurancePaymentScreen();

  @override
  State<InsurancePaymentScreen> createState() => _InsurancePaymentScreenState();
}

class _InsurancePaymentScreenState extends State<InsurancePaymentScreen> {
  final idNumberController = TextEditingController();
  final companyInsuranceNameController = TextEditingController();
  final phoneController = TextEditingController();
  final productListController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 68.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 17.w,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 44.w,
                    height: 42.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.76.r),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x23EA6A58),
                          blurRadius: 20,
                          offset: Offset(0, 4.41),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 75.w),
                Text(
                  'Insurance Payment',
                  style: openSans16W500(color: const Color(0xff1E1E1E)),
                ),
              ],
            ),
            SizedBox(
              height: 27.h,
            ),
            Text(
              "Product list",
              style: openSans14W500(color: AppColors.primary),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomInsuranceContainer(
              controller: idNumberController,
              text: "ID Number",
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 22.h,
            ),
            CustomInsuranceContainer(
              controller: phoneController,
              text: "Mobile Number",
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 22.h,
            ),
            CustomInsuranceContainer(
              controller: companyInsuranceNameController,
              text: "Company insurance name",
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 22.h,
            ),
            CustomInsuranceContainer(
              controller: productListController,
              text: "Product list",
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 22.h,
            ),
            CustomInsuranceContainer(
              controller: noteController,
              text: "Note",
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 24.h,
            ),
            DefaultTextButton(function: () {}, text: "Send Request"),
          ],
        ),
      ),
    );
  }
}
