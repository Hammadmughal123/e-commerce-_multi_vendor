// import 'controller/schedule_order_controller.dart';
// import '../../core/app_export.dart';
// import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
// import '../../widgets/app_bar/appbar_subtitle_one.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_checkbox_button.dart';
// import '../../widgets/custom_elevated_button.dart';
// import 'package:calendar_date_picker2/calendar_date_picker2.dart';
// import 'package:flutter/material.dart';

// // ignore_for_file: must_be_immutable
// class ScheduleOrderScreen extends GetWidget<ScheduleOrderController> {
//   ScheduleOrderScreen({Key? key})
//       : super(
//           key: key,
//         );
//   List<DateTime?> _dates = [];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: _buildAppBar(),

//         body: Column(
//           children: [
            
//           ],
//         ),
//         // body: Container(
//         //   width: double.maxFinite,
//         //   padding: EdgeInsets.symmetric(
//         //     horizontal: 23.h,
//         //     vertical: 14.v,
//         //   ),
//         //   child: SingleChildScrollView(
//         //     child: Column(
//         //       children: [
//         //         _buildDurationRow(),
//         //         SizedBox(height: 20.v),
//         //         _buildCalendar(),
//         //         SizedBox(height: 15.v),
//         //         Align(
//         //           alignment: Alignment.centerLeft,
//         //           child: Text(
//         //             "lbl_time".tr,
//         //             style: CustomTextStyles.titleLargeBlack900,
//         //           ),
//         //         ),
//         //         SizedBox(height: 13.v),
//         //         _buildClockStack(),
//         //         SizedBox(height: 21.v),
//         //         Opacity(
//         //           opacity: 0.6125233,
//         //           child: Divider(
//         //             color: appTheme.gray40065,
//         //           ),
//         //         ),
//         //         SizedBox(height: 17.v),
//         //         Align(
//         //           alignment: Alignment.centerLeft,
//         //           child: Padding(
//         //             padding: EdgeInsets.only(left: 14.h),
//         //             child: Text(
//         //               "lbl_reminder".tr,
//         //               style: CustomTextStyles.titleSmallLatoBluegray300,
//         //             ),
//         //           ),
//         //         ),
//         //         SizedBox(height: 14.v),
//         //         _buildSendPrototypeCheckBox(),
//         //         SizedBox(height: 41.v),
//         //         CustomElevatedButton(
//         //           onPressed: () {
//         //             Get.toNamed(AppRoutes.trackScheduleOrderScreen);
//         //           },
//         //           text: "lbl_set_order".tr.toUpperCase(),
//         //         ),

//         //         SizedBox(height: 5.v),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//       ),
//     );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar() {
//     return CustomAppBar(
//       leadingWidth: 69.h,
//       leading: AppbarLeadingIconbuttonThree(
//         imagePath: ImageConstant.imgClockBlueGray5001,
//         margin: EdgeInsets.only(
//           left: 24.h,
//           top: 5.v,
//           bottom: 5.v,
//         ),
//       ),
//       title: AppbarSubtitleOne(
//         text: "lbl_schedule_order2".tr,
//         margin: EdgeInsets.only(left: 18.h),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildDurationRow() {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: EdgeInsets.only(right: 16.h),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "lbl_month_2000".tr,
//               style: CustomTextStyles.titleLargeBlack900,
//             ),
//             CustomImageView(
//               imagePath: ImageConstant.imgCheckmarkPrimary6x14,
//               height: 6.v,
//               width: 14.h,
//               margin: EdgeInsets.only(
//                 left: 9.h,
//                 top: 9.v,
//                 bottom: 8.v,
//               ),
//             ),
//             Spacer(),
//             CustomImageView(
//               imagePath: ImageConstant.imgArrowLeft,
//               height: 14.v,
//               width: 6.h,
//               margin: EdgeInsets.only(
//                 top: 4.v,
//                 bottom: 6.v,
//               ),
//             ),
//             CustomImageView(
//               imagePath: ImageConstant.imgArrowRightPrimary,
//               height: 14.v,
//               width: 6.h,
//               margin: EdgeInsets.only(
//                 left: 23.h,
//                 top: 4.v,
//                 bottom: 6.v,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildCalendar() {
//     return Obx(
//       () => SizedBox(
//         height: 284.v,
//         width: 328.h,
//         child: CalendarDatePicker2(
//           config: CalendarDatePicker2Config(
//             calendarType: CalendarDatePicker2Type.single,
//             firstDate: DateTime(DateTime.now().year - 5),
//             lastDate: DateTime(DateTime.now().year + 5),
//             firstDayOfWeek: 1,
//             weekdayLabelTextStyle: TextStyle(
//               color: appTheme.gray80099,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w400,
//             ),
//             selectedDayTextStyle: TextStyle(
//               color: Color(0XFFFFFFFF),
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w400,
//             ),
//             dayTextStyle: TextStyle(
//               color: appTheme.gray60002,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w400,
//             ),
//             disabledDayTextStyle: TextStyle(
//               color: appTheme.gray60002,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w400,
//             ),
//             weekdayLabels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
//             dayBorderRadius: BorderRadius.circular(
//               17.h,
//             ),
//           ),
//           value: controller.selectedDatesFromCalendar1.value,
//           onValueChanged: (dates) {
//             controller.selectedDatesFromCalendar1.value = dates;
//           },
//         ),
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildClockStack() {
//     return SizedBox(
//       height: 85.v,
//       width: 327.h,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 128.h,
//                 vertical: 4.v,
//               ),
//               decoration: AppDecoration.fillDeepOrange.copyWith(
//                 borderRadius: BorderRadiusStyle.roundedBorder1,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 2.v),
//                   Text(
//                     "lbl5".tr,
//                     style: CustomTextStyles.bodyLargeGreen700,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 55.h,
//                 right: 62.h,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         "lbl_04".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 488.v),
//                       Text(
//                         "lbl_05".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 454.v),
//                       Text(
//                         "lbl_06".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 420.v),
//                       Text(
//                         "lbl_07".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 386.v),
//                       Text(
//                         "lbl_08".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 352.v),
//                       Text(
//                         "lbl_09".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 318.v),
//                       Text(
//                         "lbl_102".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 284.v),
//                       Text(
//                         "lbl_11".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 250.v),
//                       Text(
//                         "lbl_12".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 216.v),
//                       Text(
//                         "lbl_01".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 182.v),
//                       Text(
//                         "lbl_02".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 148.v),
//                       Text(
//                         "lbl_03".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 114.v),
//                       Text(
//                         "lbl_04".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 80.v),
//                       Text(
//                         "lbl_05".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 46.v),
//                       Text(
//                         "lbl_06".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 12.v),
//                       Text(
//                         "lbl_07".tr,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 12.v),
//                       Text(
//                         "lbl_08".tr,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 12.v),
//                       Text(
//                         "lbl_09".tr,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 15.v),
//                       Text(
//                         "lbl_102".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 49.v),
//                       Text(
//                         "lbl_11".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 83.v),
//                       Text(
//                         "lbl_12".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 117.v),
//                       Text(
//                         "lbl_01".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 151.v),
//                       Text(
//                         "lbl_02".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 185.v),
//                       Text(
//                         "lbl_03".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 219.v),
//                       Text(
//                         "lbl_04".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 253.v),
//                       Text(
//                         "lbl_05".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 287.v),
//                       Text(
//                         "lbl_06".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 321.v),
//                       Text(
//                         "lbl_07".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 355.v),
//                       Text(
//                         "lbl_08".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 389.v),
//                       Text(
//                         "lbl_09".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 423.v),
//                       Text(
//                         "lbl_102".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 457.v),
//                       Text(
//                         "lbl_11".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                       SizedBox(height: 491.v),
//                       Text(
//                         "lbl_12".tr,
//                         textAlign: TextAlign.center,
//                         style: CustomTextStyles.bodyLargeGray900,
//                       ),
//                     ],
//                   ),
//                   Spacer(
//                     flex: 71,
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         "lbl_00".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 351.v),
//                       Text(
//                         "lbl_05".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 317.v),
//                       Text(
//                         "lbl_102".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 283.v),
//                       Text(
//                         "lbl_15".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 249.v),
//                       Text(
//                         "lbl_20".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 215.v),
//                       Text(
//                         "lbl_25".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 181.v),
//                       Text(
//                         "lbl_30".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 147.v),
//                       Text(
//                         "lbl_35".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 113.v),
//                       Text(
//                         "lbl_402".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 79.v),
//                       Text(
//                         "lbl_45".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 45.v),
//                       Text(
//                         "lbl_502".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 11.v),
//                       Text(
//                         "lbl_55".tr,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 11.v),
//                       Text(
//                         "lbl_00".tr,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 12.v),
//                       Text(
//                         "lbl_05".tr,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 16.v),
//                       Text(
//                         "lbl_102".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 50.v),
//                       Text(
//                         "lbl_15".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 84.v),
//                       Text(
//                         "lbl_20".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 118.v),
//                       Text(
//                         "lbl_25".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 152.v),
//                       Text(
//                         "lbl_30".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 186.v),
//                       Text(
//                         "lbl_35".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 220.v),
//                       Text(
//                         "lbl_402".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 254.v),
//                       Text(
//                         "lbl_45".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 288.v),
//                       Text(
//                         "lbl_502".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 322.v),
//                       Text(
//                         "lbl_55".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 356.v),
//                       Text(
//                         "lbl_00".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 390.v),
//                       Text(
//                         "lbl_05".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 424.v),
//                       Text(
//                         "lbl_102".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 458.v),
//                       Text(
//                         "lbl_15".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 492.v),
//                       Text(
//                         "lbl_20".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 526.v),
//                       Text(
//                         "lbl_25".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 560.v),
//                       Text(
//                         "lbl_30".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 594.v),
//                       Text(
//                         "lbl_35".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 628.v),
//                       Text(
//                         "lbl_402".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 662.v),
//                       Text(
//                         "lbl_45".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 696.v),
//                       Text(
//                         "lbl_502".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                       SizedBox(height: 730.v),
//                       Text(
//                         "lbl_55".tr,
//                         textAlign: TextAlign.center,
//                         style: theme.textTheme.bodyLarge,
//                       ),
//                     ],
//                   ),
//                   Spacer(
//                     flex: 28,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 33.v),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             "lbl_am".tr,
//                             style: CustomTextStyles.bodyLargeGray90002,
//                           ),
//                         ),
//                         SizedBox(height: 12.v),
//                         Text(
//                           "lbl_pm".tr,
//                           style: CustomTextStyles.bodyLargeGray90002,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildSendPrototypeCheckBox() {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: 14.h,
//         right: 15.h,
//       ),
//       child: Obx(
//         () => CustomCheckboxButton(
//           text: "msg_send_prototype_of".tr,
//           value: controller.sendPrototypeCheckBox.value,
//           textStyle: CustomTextStyles.titleSmallLatoBluegray20001,
//           onChange: (value) {
//             controller.sendPrototypeCheckBox.value = value;
//           },
//         ),
//       ),
//     );
//   }
// }
