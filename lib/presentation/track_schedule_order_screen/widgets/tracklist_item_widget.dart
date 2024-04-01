import '../controller/track_schedule_order_controller.dart';
import '../models/tracklist_item_model.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TracklistItemWidget extends StatelessWidget {
  TracklistItemWidget(
    this.tracklistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TracklistItemModel tracklistItemModelObj;

  var controller = Get.find<TrackScheduleOrderController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 139.h,
            margin: EdgeInsets.only(
              left: 4.h,
              top: 3.v,
              bottom: 1.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    tracklistItemModelObj.numberText!.value,
                    style: CustomTextStyles.displaySmallBluegray300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 6.v,
                    bottom: 3.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          tracklistItemModelObj.monthText!.value,
                          style: CustomTextStyles.labelMediumBluegray500,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      Obx(
                        () => Text(
                          tracklistItemModelObj.dayText!.value,
                          style: CustomTextStyles.labelMediumBluegray300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => CustomImageView(
              imagePath: tracklistItemModelObj.trackImage!.value,
              height: 49.v,
              width: 56.h,
              radius: BorderRadius.circular(
                10.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
