import 'controller/store_view_two_controller.dart';
import 'models/store_view_two_model.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class StoreViewTwoPage extends StatelessWidget {
  StoreViewTwoPage({Key? key})
      : super(
          key: key,
        );

  StoreViewTwoController controller =
      Get.put(StoreViewTwoController(StoreViewTwoModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildScrollView(),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 31.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_fruits".tr,
                  style: CustomTextStyles.titleLargeGray900_1,
                ),
                SizedBox(height: 15.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.h),
                      child: _buildBurger02(
                        image: ImageConstant.imgImage5,
                        orange: "lbl_banana".tr,
                        japan: "lbl_indians".tr,
                        price: "lbl_40".tr,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: _buildBurger02(
                        image: ImageConstant.imgImage6,
                        orange: "lbl_orange".tr,
                        japan: "lbl_japan".tr,
                        price: "lbl_40".tr,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 179.v,
                      width: 153.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 153.h,
                              margin: EdgeInsets.only(top: 5.v),
                              padding: EdgeInsets.symmetric(vertical: 17.v),
                              decoration: AppDecoration
                                  .outlineSecondaryContainer
                                  .copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder24,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 68.v,
                                      bottom: 5.v,
                                    ),
                                    child: _buildMeatPizza(
                                      menuItemName: "lbl_meat_pizza".tr,
                                      menuItemDescription:
                                          "lbl_spicy_burger".tr,
                                      menuItemPrice: "lbl_40".tr,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 110.v),
                                    child: CustomIconButton(
                                      height: 30.adaptSize,
                                      width: 30.adaptSize,
                                      padding: EdgeInsets.all(9.h),
                                      decoration:
                                          IconButtonStyleHelper.fillYellow,
                                      child: CustomImageView(
                                        imagePath: ImageConstant.imgClose,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.img46PizzaPngImageThumb,
                            height: 85.v,
                            width: 91.h,
                            alignment: Alignment.topCenter,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.v),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 5.v,
                      ),
                      decoration:
                          AppDecoration.outlineSecondaryContainer.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImageView(
                            imagePath:
                                ImageConstant.img46PizzaPngImageThumb77x78,
                            height: 77.v,
                            width: 78.h,
                          ),
                          SizedBox(height: 5.v),
                          SizedBox(
                            width: 129.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5.v),
                                  child: _buildMeatPizza(
                                    menuItemName: "lbl_meat_pizza".tr,
                                    menuItemDescription: "lbl_spicy_burger".tr,
                                    menuItemPrice: "lbl_40".tr,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 41.v),
                                  child: CustomIconButton(
                                    height: 30.adaptSize,
                                    width: 30.adaptSize,
                                    padding: EdgeInsets.all(9.h),
                                    decoration:
                                        IconButtonStyleHelper.fillYellow,
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgClose,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.v),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildBurger02({
    required String image,
    required String orange,
    required String japan,
    required String price,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.outlineSecondaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          CustomImageView(
            imagePath: image,
            height: 75.v,
            width: 114.h,
            radius: BorderRadius.circular(
              15.h,
            ),
            alignment: Alignment.center,
          ),
          SizedBox(height: 9.v),
          Text(
            orange,
            style: CustomTextStyles.titleSmallBluegray90002.copyWith(
              color: appTheme.blueGray90002,
            ),
          ),
          SizedBox(height: 4.v),
          Text(
            japan,
            style: CustomTextStyles.bodyMediumBluegray600.copyWith(
              color: appTheme.blueGray600,
            ),
          ),
          SizedBox(
            width: 129.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.v,
                    bottom: 4.v,
                  ),
                  child: Text(
                    price,
                    style: CustomTextStyles.titleMediumGray900_1.copyWith(
                      color: appTheme.gray900,
                    ),
                  ),
                ),
                CustomIconButton(
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  padding: EdgeInsets.all(9.h),
                  decoration: IconButtonStyleHelper.fillYellow,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgClose,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildMeatPizza({
    required String menuItemName,
    required String menuItemDescription,
    required String menuItemPrice,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          menuItemName,
          style: CustomTextStyles.titleSmallBluegray9000215.copyWith(
            color: appTheme.blueGray90002,
          ),
        ),
        SizedBox(height: 5.v),
        Text(
          menuItemDescription,
          style: CustomTextStyles.bodyMediumBluegray600.copyWith(
            color: appTheme.blueGray600,
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          menuItemPrice,
          textAlign: TextAlign.right,
          style: CustomTextStyles.titleMediumGray900_1.copyWith(
            color: appTheme.gray900,
          ),
        ),
      ],
    );
  }
}
