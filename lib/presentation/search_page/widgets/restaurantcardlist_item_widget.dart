import '../controller/search_controller.dart';
import '../models/restaurantcardlist_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart' hide SearchController;

// ignore: must_be_immutable
class RestaurantcardlistItemWidget extends StatelessWidget {
  RestaurantcardlistItemWidget(
    this.restaurantcardlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RestaurantcardlistItemModel restaurantcardlistItemModelObj;

  var controller = Get.find<CustomSearchController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => CustomImageView(
            imagePath: restaurantcardlistItemModelObj.image!.value,
            height: 50.v,
            width: 60.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.h,
            top: 2.v,
            bottom: 2.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  restaurantcardlistItemModelObj.restaurantName!.value,
                  style: CustomTextStyles.bodyLargeSenBluegray90002,
                ),
              ),
              SizedBox(height: 5.v),
              Row(
                children: [
                  Obx(
                    () => CustomImageView(
                      imagePath:
                          restaurantcardlistItemModelObj.ratingImage!.value,
                      height: 15.adaptSize,
                      width: 15.adaptSize,
                      radius: BorderRadius.circular(
                        1.h,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 2.v),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Obx(
                      () => Text(
                        restaurantcardlistItemModelObj.ratingText!.value,
                        style: CustomTextStyles.bodyLargeSenGray900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
