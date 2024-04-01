import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarTitleDropdownOne extends StatelessWidget {
  AppbarTitleDropdownOne({
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
        width: 110.h,
        hintText: "lbl_burger".tr.toUpperCase(),
        items: items,
        onChanged: (value) {
          onTap(value!);
        },
      ),
    );
  }
}
