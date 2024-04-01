import '../controller/store_view_two_tab_container_controller.dart';
import '../models/thirtytwo_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThirtytwoItemWidget extends StatelessWidget {
  ThirtytwoItemWidget(
    this.thirtytwoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ThirtytwoItemModel thirtytwoItemModelObj;

  var controller = Get.find<StoreViewTwoTabContainerController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageView(
        imagePath: ImageConstant.imgIamge321x375,
        height: 321.v,
        width: 375.h,
        radius: BorderRadius.vertical(
          bottom: Radius.circular(24.h),
        ),
      ),
    );
  }
}
