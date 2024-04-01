import '../models/eightynine_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EightynineItemWidget extends StatelessWidget {
  EightynineItemWidget(
    this.eightynineItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  EightynineItemModel eightynineItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 13.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          eightynineItemModelObj.one!.value,
          style: TextStyle(
            color: (eightynineItemModelObj.isSelected?.value ?? false)
                ? appTheme.whiteA700
                : appTheme.blueGray700,
            fontSize: 18.fSize,
            fontFamily: 'Sen',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (eightynineItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.whiteA700,
        selectedColor: appTheme.yellow900,
        shape: (eightynineItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  24.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.gray20001,
                  width: 2.h,
                ),
                borderRadius: BorderRadius.circular(
                  24.h,
                ),
              ),
        onSelected: (value) {
          eightynineItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
