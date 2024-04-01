import '../models/ninetyone_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NinetyoneItemWidget extends StatelessWidget {
  NinetyoneItemWidget(
    this.ninetyoneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NinetyoneItemModel ninetyoneItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 17.h,
          vertical: 13.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          ninetyoneItemModelObj.min!.value,
          style: TextStyle(
            color: appTheme.whiteA700,
            fontSize: 16.fSize,
            fontFamily: 'Sen',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (ninetyoneItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.yellow900,
        selectedColor: appTheme.yellow900,
        shape: (ninetyoneItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.whiteA700.withOpacity(0.6),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  23.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  23.h,
                ),
              ),
        onSelected: (value) {
          ninetyoneItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
