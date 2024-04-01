import '../models/homechipviewsection_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomechipviewsectionItemWidget extends StatelessWidget {
  HomechipviewsectionItemWidget(
    this.homechipviewsectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HomechipviewsectionItemModel homechipviewsectionItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 27.h,
          vertical: 14.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          homechipviewsectionItemModelObj.home!.value,
          style: TextStyle(
            color: (homechipviewsectionItemModelObj.isSelected?.value ?? false)
                ? appTheme.whiteA700
                : appTheme.blueGray90001,
            fontSize: 14.fSize,
            fontFamily: 'Sen',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (homechipviewsectionItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.gray10001,
        selectedColor: appTheme.yellow900,
        shape: (homechipviewsectionItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  22.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  22.h,
                ),
              ),
        onSelected: (value) {
          homechipviewsectionItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
