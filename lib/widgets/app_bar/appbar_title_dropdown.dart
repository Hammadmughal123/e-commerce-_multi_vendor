import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTitleDropdown extends StatelessWidget {
  AppbarTitleDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onTap,
    this.margin,
  }) : super(
          key: key,
        );

  String? hintText;

  List<SelectionPopupModel> items;

  Function(SelectionPopupModel) onTap;

  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomDropDown(
        width: 130.h,
        hintText: "msg_operating_office".tr,
        items: items,
        onChanged: (value) {
          onTap(value!);
        },
      ),
    );
  }
}
