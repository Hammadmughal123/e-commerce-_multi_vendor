import 'controller/add_new_card_controller.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_two.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AddNewCardScreen extends GetWidget<AddNewCardController> {
  AddNewCardScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 22.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("msg_card_holder_name".tr.toUpperCase(),
                              style: theme.textTheme.bodyMedium),
                          SizedBox(height: 11.v),
                          CustomTextFormField(
                              controller: controller.nameController,
                              hintText: "lbl_jon_bro".tr,
                              hintStyle: CustomTextStyles
                                  .bodyLargeSenBluegray90002Regular_1),
                          SizedBox(height: 27.v),
                          Text("lbl_card_number".tr.toUpperCase(),
                              style: theme.textTheme.bodyMedium),
                          SizedBox(height: 11.v),
                          CustomTextFormField(
                              controller: controller.cardNumberController,
                              hintText: "msg_9875".tr,
                              hintStyle: CustomTextStyles
                                  .bodyLargeSenBluegray90002Regular_1,
                              borderDecoration:
                                  TextFormFieldStyleHelper.fillGrayTL10),
                          SizedBox(height: 27.v),
                          _buildNinety(),
                          SizedBox(height: 5.v)
                        ]),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: _buildAddMakePayment()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 69.h,
        leading: AppbarLeadingIconbuttonTwo(
            imagePath: ImageConstant.imgCloseGray900,
            margin: EdgeInsets.only(left: 24.h, top: 5.v, bottom: 5.v),
            onTap: () {
              onTapClose();
            }),
        title: AppbarSubtitleOne(
            text: "lbl_add_card".tr, margin: EdgeInsets.only(left: 18.h)));
  }

  /// Section Widget
  Widget _buildExpireDate() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 13.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("lbl_expire_date".tr.toUpperCase(),
                  style: theme.textTheme.bodyMedium),
              SizedBox(height: 11.v),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.v),
                  decoration: AppDecoration.fillGray10001.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    Opacity(
                        opacity: 0.5,
                        child: Padding(
                            padding: EdgeInsets.only(top: 4.v),
                            child: Text("lbl_mm_yyyy".tr,
                                style: CustomTextStyles
                                    .bodyLargeSenBluegray90002Regular)))
                  ]))
            ])));
  }

  /// Section Widget
  Widget _buildCvc() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 13.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("lbl_cvc".tr.toUpperCase(),
                  style: theme.textTheme.bodyMedium),
              SizedBox(height: 11.v),
              CustomTextFormField(
                  width: 150.h,
                  controller: controller.languageController,
                  hintText: "lbl6".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_password".tr;
                    }
                    return null;
                  },
                  obscureText: true)
            ])));
  }

  /// Section Widget
  Widget _buildNinety() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildExpireDate(), _buildCvc()]);
  }

  /// Section Widget
  Widget _buildAddMakePayment() {
    return CustomElevatedButton(
        text: "msg_add_make_payment".tr.toUpperCase(),
        margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 34.v));
  }

  /// Navigates to the previous screen.
  onTapClose() {
    Get.back();
  }
}
