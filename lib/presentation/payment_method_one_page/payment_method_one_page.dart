import 'controller/payment_method_one_controller.dart';
import 'models/payment_method_one_model.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class PaymentMethodOnePage extends StatelessWidget {
  PaymentMethodOnePage({Key? key})
      : super(
          key: key,
        );

  PaymentMethodOneController controller =
      Get.put(PaymentMethodOneController(PaymentMethodOneModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              SizedBox(height: 23.v),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMasterCardSection(),
                      SizedBox(height: 15.v),
                      CustomOutlinedButton(
                        text: "lbl_add_new".tr.toUpperCase(),
                        leftIcon: Container(
                          margin: EdgeInsets.only(right: 10.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgPlusPrimary14x14,
                            height: 14.adaptSize,
                            width: 14.adaptSize,
                          ),
                        ),
                        buttonStyle: CustomButtonStyles.outlineGray,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 9.v,
                              bottom: 10.v,
                            ),
                            child: Text(
                              "lbl_total2".tr.toUpperCase(),
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14.h),
                            child: Text(
                              "lbl_96".tr,
                              style: CustomTextStyles.headlineLargeGray900,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 27.v),
                      CustomElevatedButton(
                        text: "lbl_pay_confirm".tr.toUpperCase(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMasterCardSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillGray10002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "lbl_master_card2".tr,
            style: CustomTextStyles.titleMediumBluegray90002_1,
          ),
          SizedBox(height: 1.v),
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCloseBlueGray90004,
                  height: 17.v,
                  width: 28.h,
                  margin: EdgeInsets.only(
                    top: 6.v,
                    bottom: 2.v,
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 7.h,
                      top: 3.v,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "lbl7".tr,
                      style: CustomTextStyles.bodyLargeSenBluegray90002Regular,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.h,
                    top: 6.v,
                  ),
                  child: Text(
                    "lbl_875".tr,
                    style: CustomTextStyles.bodyLargeSenBluegray90002Regular_2,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowDown,
                  height: 7.v,
                  width: 10.h,
                  radius: BorderRadius.circular(
                    1.h,
                  ),
                  margin: EdgeInsets.only(bottom: 19.v),
                ),
              ],
            ),
          ),
          SizedBox(height: 3.v),
        ],
      ),
    );
  }
}
