import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/blood_banks/data/models/blood_bank.dart';
import 'package:medlife_v2/ui/resources/commponents.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/share_bottom_sheet.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BloodBankDetailsScreen extends StatefulWidget {
  const BloodBankDetailsScreen();

  @override
  State<BloodBankDetailsScreen> createState() => _BloodBankDetailsScreenState();
}

class _BloodBankDetailsScreenState extends State<BloodBankDetailsScreen> {
  int _counter = 1;
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final bloodBank = ModalRoute.of(context)!.settings.arguments! as BloodBank;
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
                      InkWell(
                        onTap: () => shareBottomSheet(context),
                        child: const Icon(Icons.share_outlined),
                      ),
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
                        itemCount: bloodBank.imagesUrls.length,
                        controller: controller,
                        itemBuilder: (context, index) =>
                            Image.asset(bloodBank.imagesUrls[index]),
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
                  count: bloodBank.imagesUrls.length,
                  effect: ExpandingDotsEffect(dotHeight: 8.h, dotWidth: 8.w),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                bloodBank.title,
                style: openSans20W600(color: Colors.black),
              ),
              SizedBox(
                height: 6.h,
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
              // SizedBox(
              //   height: 16.h,
              // ),
              // CustomSealerContainer(
              //   text: "Provided by",
              //   sealerName: bloodBank.providerName,
              //   starImage: "assets/images/star.png",
              //   rate: '',
              // ),
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
                bloodBank.description,
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
                          "$currency ${(_counter * bloodBank.price).toStringAsFixed(2)}",
                          style: openSans16W400(color: const Color(0x7F1A1A1A)),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 23.w,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
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

  void shareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ShareBottomSheet();
      },
      isScrollControlled: true,
      backgroundColor: const Color(0xff323434),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          topLeft: Radius.circular(25.r),
        ),
      ),
    );
  }
}
