import 'package:abu_s_application7/presentation/home_page/widget/see_all_widget.dart';
import 'package:abu_s_application7/presentation/search_page/search_page.dart';
import 'package:abu_s_application7/widgets/store_widget/store_widget.dart';
import '../orders_page/orders_page.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_leading_iconbutton_one.dart';
import '../../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../../widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

import 'widget/category_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key})
      : super(
          key: key,
        );

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(builder: (ctrl) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            actions: [
              AppbarTrailingIconbutton(
                onTap: () {
                  Get.toNamed(AppRoutes.userCartScreen);
                },
                imagePath: ImageConstant.imgBag,
                margin: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 3.v,
                ),
              ),
            ],
            title: Column(
              children: [
                Text(
                  "lbl_deliver_to".tr,
                  style:
                      TextStyle(color: appTheme.deepOrangeA20002, fontSize: 14),
                ),
                //Text(controller.name!)
              ],
            ),
            leading: AppbarLeadingIconbuttonOne(
              imagePath: ImageConstant.imgMenu,
              margin: EdgeInsets.only(
                left: 14.h,
                top: 7.v,
                bottom: 3.v,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.h, top: 8.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_hey_operator".tr,
                          style: CustomTextStyles.bodyLargeSenff1e1d1d,
                        ),
                        TextSpan(
                          text: "lbl_good_afternoon".tr,
                          style: CustomTextStyles.titleMediumff1e1d1d,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 17.v),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: CustomSearchView(
                      onTap: () {
                        Get.to(() => SearchPage());
                      },
                      //    controller: controller.searchController,
                      hintText: "msg_search_dishes".tr,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SeeAllWidget(
                  text: 'All Categories',
                  onTap: () {
                    Get.toNamed(AppRoutes.catagoriesScreen);
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                CategoryWidget(),
                SizedBox(
                  height: 40,
                ),
                SeeAllWidget(
                  text: 'Stores And Restaurants',
                  onTap: () {
                    Get.toNamed(AppRoutes.allStoreScreen);
                  },
                ),
                StoreWidget(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
