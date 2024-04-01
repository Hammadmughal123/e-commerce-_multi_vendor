import 'controller/offer_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class OfferDialog extends StatelessWidget {
  OfferDialog(
    this.controller, {
    Key? key,
  }) : super(
          key: key,
        );

  OfferController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.h,
      padding: EdgeInsets.symmetric(
        horizontal: 23.h,
        vertical: 29.v,
      ),
      decoration: AppDecoration.gradientOrangeToYellow.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder35,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8.v),
          SizedBox(
            height: 260.v,
            width: 279.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 276.h,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_1243cd2".tr,
                            style: CustomTextStyles.headlineLargeffffffff,
                          ),
                          TextSpan(
                            text: "msg_use_the_cupon_get".tr,
                            style: CustomTextStyles.titleMediumffffffff,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 52.v),
                    child: Text(
                      "lbl_hurry_offers".tr,
                      style: theme.textTheme.displayMedium,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgElements,
                  height: 190.v,
                  width: 270.h,
                  alignment: Alignment.topCenter,
                ),
              ],
            ),
          ),
          SizedBox(height: 6.v),
          CustomOutlinedButton(
            text: "lbl_got_it".tr.toUpperCase(),
            buttonStyle: CustomButtonStyles.outlineWhiteA,
            buttonTextStyle: theme.textTheme.titleMedium!,
          ),
        ],
      ),
    );
  }
}
