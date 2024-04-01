import 'controller/payment_method_controller.dart';
import 'models/payment_method_model.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  PaymentMethodPage({Key? key})
      : super(
          key: key,
        );

  PaymentMethodController controller =
      Get.put(PaymentMethodController(PaymentMethodModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: Container(
         // foregroundDecoration: Colors.accents,
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              SizedBox(height: 23.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNoMastercardSection(),
                    SizedBox(height: 15.v),
                    CustomOutlinedButton(
                      onPressed: (){
                        Get.toNamed(AppRoutes.addNewCardScreen);
                      },
                      text: "lbl_add_new".tr.toUpperCase(),
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 10.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgPlusPrimary,
                          height: 14.adaptSize,
                          width: 14.adaptSize,
                        ),
                      ),
                      buttonStyle: CustomButtonStyles.outlineGray,
                    ),
                    SizedBox(height: 73.v),
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
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNoMastercardSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 46.h,
        vertical: 28.v,
      ),
      decoration: AppDecoration.fillGray10003.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img42,
            height: 117.v,
            width: 200.h,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 1.h),
          ),
          SizedBox(height: 12.v),
          Text(
            "msg_no_master_card_added".tr,
            style: CustomTextStyles.titleMediumBluegray90002_1,
          ),
          SizedBox(height: 8.v),
          Opacity(
            opacity: 0.7,
            child: SizedBox(
              width: 231.h,
              child: Text(
                "msg_you_can_add_a_mastercard".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyMediumBluegray90004.copyWith(
                  height: 1.60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
