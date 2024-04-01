import 'controller/orders_tab_container_controller.dart';
import 'models/orders_tab_container_model.dart';
import '../../core/app_export.dart';
import '../../presentation/orders_page/orders_page.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton_two.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class OrdersTabContainerPage extends StatelessWidget {
  OrdersTabContainerPage({Key? key})
      : super(
          key: key,
        );

  OrdersTabContainerController controller =
      Get.put(OrdersTabContainerController(OrdersTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 19.v),
              _buildTabview(),
              Expanded(
                child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    OngoingOrder(),
                    OngoingOrder(),
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
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      centerTitle: true,
      leadingWidth: 69.h,
      // leading: AppbarLeadingIconbuttonThree(
      //   imagePath: ImageConstant.imgClockBlueGray5001,
      //   margin: EdgeInsets.only(
      //     left: 24.h,
      //     top: 5.v,
      //     bottom: 5.v,
      //   ),
      // ),
      title: AppbarSubtitleOne(
        text: "lbl_my_orders".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingIconbuttonTwo(
          imagePath: ImageConstant.imgMore,
          margin: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 5.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview() {
    return Container(
      height: 34.v,
      width: double.maxFinite,
      child: TabBar(
        controller: controller.tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.deepOrangeA200,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Sen',
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: appTheme.blueGray30003,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Sen',
          fontWeight: FontWeight.w400,
        ),
        indicatorColor: theme.colorScheme.primary,
        tabs: [
          Tab(
            child: Text(
              "lbl_ongoing".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_history".tr,
            ),
          ),
        ],
      ),
    );
  }
}
