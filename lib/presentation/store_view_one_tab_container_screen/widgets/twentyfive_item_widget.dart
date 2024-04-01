import '../controller/store_view_one_tab_container_controller.dart';
import '../models/twentyfive_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TwentyfiveItemWidget extends StatelessWidget {
  TwentyfiveItemWidget(
    this.twentyfiveItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TwentyfiveItemModel twentyfiveItemModelObj;

  var controller = Get.find<StoreViewOneTabContainerController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageView(
        imagePath: ImageConstant.imgIamge,
        height: 321.v,
        width: 375.h,
        radius: BorderRadius.vertical(
          bottom: Radius.circular(24.h),
        ),
      ),
    );
  }
}
