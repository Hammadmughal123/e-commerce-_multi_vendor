// import '../controller/address_controller.dart';
// import '../models/homecomponent_item_model.dart';
// import '../../../core/app_export.dart';
// import '../../../widgets/custom_icon_button.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class HomecomponentItemWidget extends StatelessWidget {
//   HomecomponentItemWidget(
//     this.homecomponentItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );

//   HomecomponentItemModel homecomponentItemModelObj;

//   var controller = Get.find<AddressController>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(15.h),
//       decoration: AppDecoration.fillGray10001.copyWith(
//         borderRadius: BorderRadiusStyle.roundedBorder15,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(bottom: 21.v),
//             child: Obx(
//               () => CustomIconButton(
//                 height: 48.adaptSize,
//                 width: 48.adaptSize,
//                 padding: EdgeInsets.all(14.h),
//                 child: CustomImageView(
//                   imagePath: homecomponentItemModelObj.homeIcon!.value,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 14.h,
//                 bottom: 9.v,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 234.h,
//                     child: Row(
//                       children: [
//                         Obx(
//                           () => Text(
//                             homecomponentItemModelObj.homeText!.value,
//                             style: CustomTextStyles.bodyMediumBluegray90001_1,
//                           ),
//                         ),
//                         Spacer(),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgEditDeepOrangeA200,
//                           height: 15.adaptSize,
//                           width: 15.adaptSize,
//                         ),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgThumbsUpDeepOrangeA200,
//                           height: 15.v,
//                           width: 14.h,
//                           margin: EdgeInsets.only(left: 20.h),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 8.v),
//                   Opacity(
//                     opacity: 0.5,
//                     child: Container(
//                       width: 214.h,
//                       margin: EdgeInsets.only(right: 20.h),
//                       child: Obx(
//                         () => Text(
//                           homecomponentItemModelObj.addressText!.value,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: CustomTextStyles.bodyMediumBluegray90002_1,
//                         ),
//                       ),
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
// }
