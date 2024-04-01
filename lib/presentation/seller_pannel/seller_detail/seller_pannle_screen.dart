import 'package:abu_s_application7/presentation/seller_pannel/seller_detail/controller/seller_controller.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_screens/add_new_seller/model/seller_detail_model.dart';
import 'package:abu_s_application7/presentation/seller_pannel/selller_cart_product/cart_screen.dart';
import 'package:abu_s_application7/presentation/store_detail_page/store_detal_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_icon_button.dart';

class SellerPannelScreen extends StatelessWidget {
  SellerPannelScreen({Key? key}) : super(key: key);

  final SellerPannelController sellerPannelController =
      Get.find<SellerPannelController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('sellerData')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error fetching data: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Text('No data found');
                  }

                  var docSnapshot = snapshot.data as DocumentSnapshot;
                  if (!docSnapshot.exists) {
                    return Text('Document does not exist');
                  }

                  Map<String, dynamic>? data =
                      docSnapshot.data() as Map<String, dynamic>?;
                  print('...........................$data');

                  if (data != null) {
                    SellerDetailModel model = SellerDetailModel.fromJson(data);

                    if (model.sellerShopImages != null) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: SizedBox(
                          height: 160,
                          width: Get.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Center(
                                child: CupertinoActivityIndicator(),
                              ),
                              imageUrl: model.sellerShopImages![0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text('Seller images not available');
                    }
                  }

                  // Continue with the rest of your code using the 'data' variable...
                  return SizedBox();
                },
              ),
              SizedBox(
                height: 10,
              ),
              _buildNotificationOne(
                firstOnTap: () {
                  Get.toNamed(AppRoutes.storeinfo);
                },
                secondOnTap: () {
                  Get.toNamed(AppRoutes.addressScreen);
                },
                firstText: "lbl_store_info".tr,
                secondText: "lbl_address".tr,
              ),
              SizedBox(
                height: 20,
              ),
              _buildCartOne(
                  firstText: 'Cart Products',
                  onTap: () {
                    sellerPannelController.getVendorOrders().then((value) => {
                        
                        });
                  }),
              _buildProfileOne(
                // firstText: "lbl_add_product".tr,
                secondText: "lbl_favourite".tr,
              ),
              _buildNotificationOne(
                firstOnTap: () {},
                secondOnTap: () {},
                firstText: "lbl_notification".tr,
                //secondText: "lbl_all_product".tr,
              ),
              _buildSaveButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 20),
      child: CustomElevatedButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addCategoryScreen);
        },
        text: "lbl_add_product".tr.toUpperCase(),
        margin: EdgeInsets.only(
          // left: 24.h,
          // right: 24.h,
          bottom: 30.v,
        ),
        buttonTextStyle: theme.textTheme.titleMedium!,
      ),
    );
  }

  Widget _buildProfileOne({
    required String secondText,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: 13.h,
        right: 35.h,
      ),
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              // Get.toNamed(AppRoutes.addressScreen);
            },
            child: _buildAddress(
              addresses: secondText,
              // "lbl_addresses".tr,
              icon: Icon(
                Icons.map_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationOne({
    required String firstText,
    String? secondText,
    required Function() firstOnTap,
    required Function() secondOnTap,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: 13.h,
        right: 35.h,
      ),
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: firstOnTap ?? () {},
            child: _buildAddress(
                icon: Icon(
                  Icons.person_3_outlined,
                  color: Colors.black,
                ),
                addresses: firstText),
          ),
          // SizedBox(height: 16.v),
          // GestureDetector(
          //   onTap: secondOnTap ?? () {},
          //   child: _buildAddress(
          //     addresses: secondText,
          //     // "lbl_addresses".tr,
          //     icon: Icon(
          //       Icons.map_outlined,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildCartOne({required String firstText, required Function() onTap}) {
    return Container(
      margin: EdgeInsets.only(
        left: 13.h,
        right: 35.h,
      ),
      padding: EdgeInsets.all(20.h),
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap ?? () {},
            child: _buildAddress(
                icon: Icon(
                  Icons.person_3_outlined,
                  color: Colors.black,
                ),
                addresses: firstText),
          ),
          // SizedBox(height: 16.v),
          // GestureDetector(
          //   onTap: () {
          //     // Get.toNamed(AppRoutes.addressScreen);
          //   },
          //   child: _buildAddress(
          //     addresses: secondText,
          //     // "lbl_addresses".tr,
          //     icon: Icon(
          //       Icons.map_outlined,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildAddress({required String addresses, required Widget icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
            height: 40.adaptSize,
            width: 40.adaptSize,
            // padding: EdgeInsets.all(13.h),
            decoration: IconButtonStyleHelper.outlineWhiteATL20,
            child: icon),
        Padding(
          padding: EdgeInsets.only(
            left: 14.h,
            top: 10.v,
            bottom: 9.v,
          ),
          child: Text(
            addresses,
            style: CustomTextStyles.bodyLargeSenBluegray90001.copyWith(
              color: appTheme.blueGray90001,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRightGray60001,
          color: Colors.black,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 8.v),
        ),
      ],
    );
  }
}
