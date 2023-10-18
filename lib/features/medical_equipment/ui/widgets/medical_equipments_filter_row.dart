import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class MedicalEquipmentsFilterRow extends StatefulWidget {
  final String text;

  const MedicalEquipmentsFilterRow({required this.text});

  @override
  State<MedicalEquipmentsFilterRow> createState() => _MedicalEquipmentsFilterRowState();
}

class _MedicalEquipmentsFilterRowState extends State<MedicalEquipmentsFilterRow> {
  bool isClicked = false;


  List<String> medicalEquipmentsItems = [
    'Medical Equipment 1',
    'Medical Equipment 2',
    'Medical Equipment 3',
    'Medical Equipment 4',
    'Medical Equipment 5',
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
              isClicked ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
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
                        medicalEquipmentsItems[index],
                        style: openSans18W500(color: Colors.white),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.h);
                    },
                    itemCount: medicalEquipmentsItems.length,
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
