import '../controller/store_view_one_controller.dart';
import '../models/burger01_item_model.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Burger01ItemWidget extends StatelessWidget {
  Burger01ItemWidget(
    this.burger01ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Burger01ItemModel burger01ItemModelObj;

  var controller = Get.find<StoreViewOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.outlineSecondaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      width: 153.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          CustomImageView(
            imagePath: ImageConstant.imgImage75x114,
            height: 75.v,
            width: 114.h,
            radius: BorderRadius.circular(
              15.h,
            ),
            alignment: Alignment.center,
          ),
          SizedBox(height: 7.v),
          Obx(
            () => Text(
              burger01ItemModelObj.burgerName!.value,
              style: CustomTextStyles.titleSmallBluegray9000215,
            ),
          ),
          SizedBox(height: 3.v),
          Obx(
            () => Text(
              burger01ItemModelObj.restaurantName!.value,
              style: CustomTextStyles.bodyMediumBluegray600,
            ),
          ),
          SizedBox(height: 1.v),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 5.v,
                  bottom: 4.v,
                ),
                child: Obx(
                  () => Text(
                    burger01ItemModelObj.price!.value,
                    style: CustomTextStyles.titleMediumGray900_1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 72.h),
                child: CustomIconButton(
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  padding: EdgeInsets.all(9.h),
                  decoration: IconButtonStyleHelper.fillYellow,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgClose,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
