import 'controller/location_access_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LocationAccessScreen extends GetWidget<LocationAccessController> {
  const LocationAccessScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 100.v),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgDelivery011,
                height: 382.v,
                width: 375.h,
              ),
              SizedBox(height: 37.v),
              CustomElevatedButton(
                onPressed: () {
                  controller.requestPermissionAndUpdateLocation().then((value) {
                  
                  });
                },
                text: "lbl_access_location".tr.toUpperCase(),
                margin: EdgeInsets.symmetric(horizontal: 24.h),
                rightIcon: Container(
                  padding: EdgeInsets.all(8.h),
                  margin: EdgeInsets.only(left: 24.h),
                  decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    borderRadius: BorderRadius.circular(
                      16.h,
                    ),
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgMappin,
                    color: Colors.black,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                  ),
                ),
                buttonTextStyle: theme.textTheme.titleMedium!,
              ),
              SizedBox(height: 38.v),
              Container(
                width: 294.h,
                margin: EdgeInsets.symmetric(horizontal: 40.h),
                child: Text(
                  "msg_food_will_access".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyLargeSenBluegray600.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
     
     ),
);
}
}