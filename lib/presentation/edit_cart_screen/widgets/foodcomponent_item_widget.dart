import '../controller/edit_cart_controller.dart';
import '../models/foodcomponent_item_model.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FoodcomponentItemWidget extends StatelessWidget {
  FoodcomponentItemWidget(
    this.foodcomponentItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FoodcomponentItemModel foodcomponentItemModelObj;

  var controller = Get.find<EditCartController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => CustomImageView(
            imagePath: foodcomponentItemModelObj.foodImage!.value,
            height: 117.v,
            width: 136.h,
            radius: BorderRadius.circular(
              25.h,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120.h,
              child: Obx(
                () => Text(
                  foodcomponentItemModelObj.foodName!.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyLargeSenWhiteA700,
                ),
              ),
            ),
            SizedBox(height: 6.v),
            Obx(
              () => Text(
                foodcomponentItemModelObj.foodPrice!.value,
                style: CustomTextStyles.titleLargeWhiteA700,
              ),
            ),
            SizedBox(height: 15.v),
            SizedBox(
              width: 171.h,
              child: Row(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Obx(
                      () => Text(
                        foodcomponentItemModelObj.foodSize!.value,
                        style: CustomTextStyles.bodyLargeSenWhiteA700Regular18,
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomIconButton(
                    height: 22.adaptSize,
                    width: 22.adaptSize,
                    padding: EdgeInsets.all(7.h),
                    decoration: IconButtonStyleHelper.fillWhiteATL11,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGroup15,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 19.h),
                    child: Obx(
                      () => Text(
                        foodcomponentItemModelObj.quantity!.value,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.h),
                    child: CustomIconButton(
                      height: 22.adaptSize,
                      width: 22.adaptSize,
                      padding: EdgeInsets.all(7.h),
                      decoration: IconButtonStyleHelper.fillWhiteATL11,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgPlus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
