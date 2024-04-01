import '../models/ninetyfour_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NinetyfourItemWidget extends StatelessWidget {
  NinetyfourItemWidget(
    this.ninetyfourItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NinetyfourItemModel ninetyfourItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: RawChip(
          padding: EdgeInsets.symmetric(
            horizontal: 17.h,
            vertical: 10.v,
          ),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            ninetyfourItemModelObj.one!.value,
            style: TextStyle(
              color: appTheme.black900.withOpacity(0),
              fontSize: 16.fSize,
              fontFamily: 'Sen',
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: (ninetyfourItemModelObj.isSelected?.value ?? false),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.transparent,
          onSelected: (value) {
            ninetyfourItemModelObj.isSelected!.value = value;
          },
        ),
      ),
    );
  }
}
