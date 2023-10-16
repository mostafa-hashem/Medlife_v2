import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/custom_payment_container.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/custom_sealer_container.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MedicalEquipmentDetailsScreen extends StatefulWidget {
  const MedicalEquipmentDetailsScreen();

  @override
  State<MedicalEquipmentDetailsScreen> createState() =>
      _MedicalEquipmentDetailsScreenState();
}

class _MedicalEquipmentDetailsScreenState
    extends State<MedicalEquipmentDetailsScreen> {
  int _counter = 1;
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final medicalEquipment =
        ModalRoute.of(context)!.settings.arguments! as MedicalEquipment;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 61.h, left: 16.w, right: 16.w),
        child: SingleChildScrollView(
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
                  const Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      const Icon(Icons.favorite_border),
                      SizedBox(
                        height: 8.h,
                      ),
                      const Icon(Icons.share_outlined),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 240.h,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: controller,
                        itemBuilder: (context, index) =>
                            Image.asset(medicalEquipment.imagesUrls.first),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Align(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 10,
                  effect: ExpandingDotsEffect(dotHeight: 8.h, dotWidth: 8.w),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                medicalEquipment.title,
                style: openSans20W600(color: Colors.black),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  Image.asset("assets/images/star.png"),
                  Text(
                    "${medicalEquipment.rating} (${medicalEquipment.numOfReviews} reviews)",
                    style: openSans10W400(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(
                indent: 10.w,
                endIndent: 10.w,
                color: const Color(0xff000000).withOpacity(0.5),
                thickness: 1,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomSealerContainer(
                text: "Sold by",
                sealerName: medicalEquipment.sellerName,
                starImage: "assets/images/star.png",
                rate: medicalEquipment.rating.toString(),
              ),
              SizedBox(
                height: 8.h,
              ),
              const CustomPaymentContainer(
                image: "assets/images/tabby_installment_mini 1.png",
                text: "Payment in 3 installments",
              ),
              SizedBox(
                height: 8.h,
              ),
              const CustomPaymentContainer(
                image: "assets/images/tamara.png",
                text: "Payment in 4 installments",
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(
                indent: 10.w,
                endIndent: 10.w,
                color: const Color(0xff000000).withOpacity(0.5),
                thickness: 1,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Description",
                style: openSans20W600(color: Colors.black),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                medicalEquipment.description,
                style: openSans14W400(color: Colors.black),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    "Quantity",
                    style: openSans20W600(color: Colors.black),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Container(
                    width: 150.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 9.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_counter < 2) {
                                  return;
                                }
                                _counter--;
                              });
                            },
                            child: const Icon(Icons.remove),
                          ),
                          Text(
                            _counter.toString(),
                            style: openSans20W600(color: Colors.black)
                                .copyWith(letterSpacing: -0.41),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _counter++;
                              });
                            },
                            child: const Icon(Icons.add_outlined),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Divider(
                    indent: 10.w,
                    endIndent: 10.w,
                    color: const Color(0xff000000).withOpacity(0.5),
                    thickness: 1,
                  ),
                ],
              ),
              Divider(
                indent: 10.w,
                endIndent: 10.w,
                color: const Color(0xff000000).withOpacity(0.5),
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 26.5),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total price",
                          style: openSans16W400(color: const Color(0x7F1A1A1A)),
                        ),
                        SizedBox(
                          height: 12.5.h,
                        ),
                        Text(
                          "\$ ${(_counter * medicalEquipment.price).toStringAsFixed(2)}",
                          style: openSans16W400(color: const Color(0x7F1A1A1A)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 23.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 230.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF22C7B6),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 9.h,
                            horizontal: 38.w,
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/Shop bag image.png"),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                "Add to cart",
                                style: openSans18W500(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
