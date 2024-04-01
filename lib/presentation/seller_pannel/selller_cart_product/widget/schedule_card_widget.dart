// import 'package:abu_s_application7/core/app_export.dart';
// import 'package:flutter/material.dart';


// class StudentactivitieslistItemWidget extends StatelessWidget {
//   StudentactivitieslistItemWidget(
//    {
//     Key? key,
//   }) : super(key: key);

 
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 1.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: ExpansionTile(
//         collapsedShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//           side: BorderSide.none,
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//           side: BorderSide.none,
//         ),
//         trailing: SizedBox(),
//         tilePadding: EdgeInsets.zero,
//         childrenPadding: EdgeInsets.symmetric(horizontal: 16),
//         expandedAlignment: Alignment.centerLeft,
//         collapsedTextColor: appTheme.gray700,
//         textColor: appTheme.gray700,
//         iconColor: appTheme.gray700,
//         backgroundColor: appTheme.whiteA700,
//         collapsedBackgroundColor: appTheme.whiteA700,
//         collapsedIconColor: appTheme.gray700,
//         initiallyExpanded: false,
//         title: Container(
//           height: 70,
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 height: 40,
//                 width: 40,
//                 child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     Obx(
//                       () => CustomImageView(
//                         imagePath:
//                             studentactivitieslistItemModelObj.bedImage1!.value,
//                         height: 40.v,
//                         width: 43.h,
//                         color: Colors.red,
//                         alignment: Alignment.centerLeft,
//                       ),
//                     ),
//                     Obx(
//                       () => CustomImageView(
//                         imagePath:
//                             studentactivitieslistItemModelObj.bedImage2!.value,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                         color: Colors.white,
//                         margin: EdgeInsets.only(top: 7.v),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 8, top: 13, bottom: 5),
//                   child: Obx(
//                     () => Text(
//                       studentactivitieslistItemModelObj.bedText!.value,
//                       textAlign: TextAlign.center,
//                       maxLines: null,
//                       style: TextStyle(
//                         color: appTheme.gray700,
//                         fontSize: 13,
//                         fontFamily: 'Noto Sans',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Obx(
//                 () => CustomImageView(
//                   imagePath: studentactivitieslistItemModelObj.bedImage3!.value,
//                   height: 30,
//                   width: 30,
//                   alignment: Alignment.centerRight,
//                   color: theme.primaryColor,
//                   margin: EdgeInsets.only(top: 5, bottom: 4),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         children: [
//           TextFormField(
//             maxLines: null,
//             decoration: InputDecoration(
//               hintText: 'Answer here',
//               hintStyle: TextStyle(
//                 color: appTheme.black900,
//                 fontWeight: FontWeight.normal,
//                 fontSize: 12,
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: theme.colorScheme.primary,
//                   width: 2,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: theme.colorScheme.primary,
//                   width: 2,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: theme.colorScheme.primary,
//                   width: 2,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: ElevatedButton(
//               style: ButtonStyle(
//                 fixedSize: MaterialStateProperty.all(Size(250, 35)),
//                 backgroundColor: MaterialStateProperty.all(
//                   theme.colorScheme.primary,
//                 ),
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(75),
//                   ),
//                 ),
//               ),
//               onPressed: () {},
//               child: Text(
//                 'Submit',
//                 style: TextStyle(color: theme.primaryColor),
//               ),
//             ),
//           ),
//         ],
//      ),
// );
// }
// }