import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class MedicalServiceFilterRow extends StatefulWidget {
  final String text;

  const MedicalServiceFilterRow({required this.text});

  @override
  State<MedicalServiceFilterRow> createState() =>
      _MedicalServiceFilterRowState();
}

class _MedicalServiceFilterRowState extends State<MedicalServiceFilterRow> {
  bool isClicked = false;

  List<String> medicalServesItems = [
    'Item 1,',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Row(
            children: [
              Text(
                widget.text,
                style: openSans16W400(color: Colors.white),
              ),
              const Spacer(),
              Icon(
                isClicked
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Visibility(
          visible: isClicked,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 160.h,
            ),
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(
                        medicalServesItems[index],
                        style: openSans18W500(color: Colors.white),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.h);
                    },
                    itemCount: medicalServesItems.length,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
