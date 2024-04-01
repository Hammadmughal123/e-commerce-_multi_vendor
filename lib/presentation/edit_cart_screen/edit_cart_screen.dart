import '../edit_cart_screen/widgets/foodcomponent_item_widget.dart';
import 'controller/edit_cart_controller.dart';
import 'models/foodcomponent_item_model.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditCartScreen extends GetWidget<EditCartController> {
  const EditCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: theme.colorScheme.onPrimary,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 18.v),
                    _buildFoodComponent(),
                    SizedBox(height: 117.v),
                    _buildInfo()
                  ]),
                ))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 69.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            margin: EdgeInsets.only(left: 24.h, top: 5.v, bottom: 5.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitle(
            text: "lbl_cart".tr, margin: EdgeInsets.only(left: 18.h)),
        actions: [
          AppbarSubtitleThree(
              text: "lbl_edit_items".tr.toUpperCase(),
              margin: EdgeInsets.fromLTRB(24.h, 21.v, 24.h, 17.v))
        ]);
  }

  /// Section Widget
  Widget _buildFoodComponent() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Obx(() => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 32.v);
            },
            itemCount: controller
                .editCartModelObj.value.foodcomponentItemList.value.length,
            itemBuilder: (context, index) {
              FoodcomponentItemModel model = controller
                  .editCartModelObj.value.foodcomponentItemList.value[index];
              return FoodcomponentItemWidget(model);
            })));
  }

  /// Section Widget
  Widget _buildInfo() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 27.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Text("msg_delivery_address".tr.toUpperCase(),
                                style: theme.textTheme.bodyMedium)),
                        Text("lbl_edit".tr.toUpperCase(),
                            style: CustomTextStyles.bodyMediumPrimary
                                .copyWith(decoration: TextDecoration.underline))
                      ])),
              SizedBox(height: 12.v),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.h),
                  child: CustomTextFormField(
                      controller: controller.addressController,
                      hintText: "msg_2118_thornridge".tr,
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 21.v))),
              SizedBox(height: 29.v),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 9.v, bottom: 10.v),
                            child: Text("lbl_total".tr.toUpperCase(),
                                style: theme.textTheme.bodyMedium)),
                        Padding(
                            padding: EdgeInsets.only(left: 12.h),
                            child: Text("lbl_96".tr,
                                style: CustomTextStyles.headlineLargeGray900)),
                        Spacer(),
                        Padding(
                            padding: EdgeInsets.only(top: 9.v, bottom: 10.v),
                            child: Text("lbl_breakdown".tr,
                                style: CustomTextStyles.bodyMediumPrimary)),
                        CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 10.v,
                            width: 5.h,
                            margin: EdgeInsets.only(
                                left: 7.h, top: 14.v, bottom: 12.v))
                      ])),
              SizedBox(height: 31.v),
              Padding(
                  padding: EdgeInsets.only(right: 1.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: CustomElevatedButton(
                              onPressed: (){
                                Get.toNamed(AppRoutes.paymentSuccessfullScreen);
                              },
                                text: "lbl_place_order".tr.toUpperCase(),
                                margin: EdgeInsets.only(right: 3.h))),
                        Expanded(
                            child: CustomOutlinedButton(
                              onPressed: (){
                                Get.toNamed(AppRoutes.scheduleOrderScreen);
                              },
                                text: "lbl_schedule_order".tr.toUpperCase(),
                                margin: EdgeInsets.only(left: 3.h),
                                buttonStyle:
                                    CustomButtonStyles.outlinePrimaryTL12))
                      ])),
              SizedBox(height: 2.v)
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
