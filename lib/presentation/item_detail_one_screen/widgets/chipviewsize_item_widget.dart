import '../models/chipviewsize_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChipviewsizeItemWidget extends StatelessWidget {
  ChipviewsizeItemWidget(
    this.chipviewsizeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ChipviewsizeItemModel chipviewsizeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewsizeItemModelObj.size!.value,
          style: TextStyle(
            color: (chipviewsizeItemModelObj.isSelected?.value ?? false)
                ? appTheme.whiteA700
                : theme.colorScheme.onPrimary,
            fontSize: 14.fSize,
            fontFamily: 'Sen',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (chipviewsizeItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.gray10001,
        selectedColor: appTheme.yellow900,
        shape: (chipviewsizeItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  24.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  24.h,
                ),
              ),
        onSelected: (value) {
          chipviewsizeItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
