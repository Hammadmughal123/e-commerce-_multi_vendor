import '../models/quality_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QualityItemWidget extends StatelessWidget {
  QualityItemWidget(
    this.qualityItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  QualityItemModel qualityItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          qualityItemModelObj.quality!.value,
          style: TextStyle(
            color: (qualityItemModelObj.isSelected?.value ?? false)
                ? appTheme.whiteA700
                : theme.colorScheme.onPrimary,
            fontSize: 14.fSize,
            fontFamily: 'Sen',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (qualityItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.gray10001,
        selectedColor: appTheme.yellow900,
        shape: (qualityItemModelObj.isSelected?.value ?? false)
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
          qualityItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
