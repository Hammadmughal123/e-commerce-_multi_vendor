import '../store_view_one_page/widgets/burger01_item_widget.dart';
import 'controller/store_view_one_controller.dart';
import 'models/burger01_item_model.dart';
import 'models/store_view_one_model.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class StoreViewOnePage extends StatelessWidget {
  StoreViewOnePage({Key? key})
      : super(
          key: key,
        );

  StoreViewOneController controller =
      Get.put(StoreViewOneController(StoreViewOneModel().obs));

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
          SizedBox(height: 34.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_burger_10".tr,
                  style: CustomTextStyles.titleLargeGray900_1,
                ),
                SizedBox(height: 12.v),
                SizedBox(
                  height: 174.v,
                  child: Obx(
                    () => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          width: 21.h,
                        );
                      },
                      itemCount: controller.storeViewOneModelObj.value
                          .burger01ItemList.value.length,
                      itemBuilder: (context, index) {
                        Burger01ItemModel model = controller
                            .storeViewOneModelObj
                            .value
                            .burger01ItemList
                            .value[index];
                        return Burger01ItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
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
                                      menuItemName1: "lbl_spicy_burger".tr,
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
                                    menuItemName1: "lbl_spicy_burger".tr,
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
  Widget _buildMeatPizza({
    required String menuItemName,
    required String menuItemName1,
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
          menuItemName1,
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
