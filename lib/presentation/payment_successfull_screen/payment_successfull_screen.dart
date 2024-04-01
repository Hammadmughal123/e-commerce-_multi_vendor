import 'controller/payment_successfull_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class PaymentSuccessfullScreen extends GetWidget<PaymentSuccessfullController> {
  const PaymentSuccessfullScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 23.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPayment011,
                height: 324.adaptSize,
                width: 324.adaptSize,
              ),
              SizedBox(height: 46.v),
              Text(
                "msg_congratulations".tr,
                style: CustomTextStyles.headlineSmallOnSecondaryContainer,
              ),
              SizedBox(height: 19.v),
              Opacity(
                opacity: 0.6,
                child: Container(
                  width: 232.h,
                  margin: EdgeInsets.symmetric(horizontal: 48.h),
                  child: Text(
                    "msg_you_successfully".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumBluegray70090.copyWith(
                      height: 1.71,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildTrackOrderButton(),
      ),
    );
  }

  /// Section Widget
  Widget _buildTrackOrderButton() {
    return CustomElevatedButton(
      text: "lbl_track_order".tr.toUpperCase(),
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 34.v,
      ),
      buttonTextStyle: theme.textTheme.titleMedium!,
    );
  }
}
