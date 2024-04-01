import '../track_schedule_order_screen/widgets/tracklist_item_widget.dart';
import 'controller/track_schedule_order_controller.dart';
import 'models/tracklist_item_model.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class TrackScheduleOrderScreen extends GetWidget<TrackScheduleOrderController> {
  const TrackScheduleOrderScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 30.v),
          child: Column(
            children: [
              SizedBox(height: 41.v),
              _buildTrackList(),
            ],
          ),
        ),
        bottomNavigationBar: _buildSetOrder(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingIconbuttonThree(
        imagePath: ImageConstant.imgClockBlueGray5001,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 5.v,
          bottom: 5.v,
        ),
      ),
      title: AppbarSubtitleOne(
        text: "msg_track_scheduled".tr,
        margin: EdgeInsets.only(left: 18.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildTrackList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: controller
              .trackScheduleOrderModelObj.value.tracklistItemList.value.length,
          itemBuilder: (context, index) {
            TracklistItemModel model = controller.trackScheduleOrderModelObj
                .value.tracklistItemList.value[index];
            return TracklistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSetOrder() {
    return CustomElevatedButton(
      text: "lbl_set_order".tr.toUpperCase(),
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 30.v,
      ),
    );
  }
}
