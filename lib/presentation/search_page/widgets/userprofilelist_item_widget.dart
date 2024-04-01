import '../controller/search_controller.dart';
import '../models/userprofilelist_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart' hide SearchController;

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofilelistItemModel userprofilelistItemModelObj;

  var controller = Get.find<CustomSearchController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144.v,
      width: 153.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle1223,
            height: 102.v,
            width: 153.h,
            radius: BorderRadius.circular(
              24.h,
            ),
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => CustomImageView(
                      imagePath: userprofilelistItemModelObj.userImage!.value,
                      height: 84.v,
                      width: 122.h,
                      radius: BorderRadius.circular(
                        15.h,
                      ),
                      margin: EdgeInsets.only(left: 5.h),
                    ),
                  ),
                  SizedBox(height: 6.v),
                  Obx(
                    () => Text(
                      userprofilelistItemModelObj.userName!.value,
                      style: CustomTextStyles.titleSmallBluegray9000215,
                    ),
                  ),
                  SizedBox(height: 3.v),
                  Obx(
                    () => Text(
                      userprofilelistItemModelObj.userDescription!.value,
                      style: CustomTextStyles.bodyMediumBluegray600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
