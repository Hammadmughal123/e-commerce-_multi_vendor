import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/address_screen/address_screen.dart';
import 'package:abu_s_application7/presentation/my_cart_screen/controller/my_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';

import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../product_detail/model/cart_model.dart';

class MyCartScreen extends StatefulWidget {
  final String? addressData;
  MyCartScreen({Key? key, this.addressData}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final MyCartController controller = Get.find<MyCartController>();
  double ogAmount = 0;
  var data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MyCartController>(builder: (ctrl) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          appBar: _buildAppBar(),
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('cartProducts')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('all')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No items in your cart.'));
                    }

                    double totalAmount = 0.0;
                    snapshot.data!.docs.forEach((doc) {
                      Map<String, dynamic> cartData =
                          doc.data() as Map<String, dynamic>;
                      CartModel cartModel = CartModel.fromJson(cartData);
                      totalAmount +=
                          double.parse(cartModel.totalPrice.toString());
                    });
                    controller.updateTotalAmount(totalAmount);

                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          Map<String, dynamic> cartData =
                              document.data() as Map<String, dynamic>;
                          CartModel cartModel = CartModel.fromJson(cartData);
                          data = cartModel;
                          return Column(
                            children: [
                              SizedBox(
                                height: 120,
                                width: Get.width,
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Container(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 100,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      placeholder:
                                                          (context, url) =>
                                                              Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                      imageUrl: cartModel
                                                          .productModel!
                                                          .productsImage![0],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cartModel.productModel!
                                                        .productDetail
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Quantity: ${cartModel.numberOfProducts}',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Price: ${cartModel.totalPrice}',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          'cartProducts')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .collection('all')
                                                      .where('totalPrice',
                                                          isEqualTo: cartModel
                                                              .totalPrice)
                                                      .limit(1)
                                                      .get()
                                                      .then((querySnapshot) {
                                                    if (querySnapshot
                                                        .docs.isNotEmpty) {
                                                      querySnapshot
                                                          .docs.first.reference
                                                          .delete()
                                                          .then((_) {
                                                        print(
                                                            "Item successfully deleted");
                                                      }).catchError((error) {
                                                        print(
                                                            "Error deleting item: $error");
                                                      });
                                                    } else {
                                                      print(
                                                          "Item not found in cart");
                                                    }
                                                  }).catchError((error) {
                                                    print(
                                                        "Error fetching item: $error");
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.red),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //  Spacer(),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: buildInfo(
            selectAddress: () {
              Get.to(() => AddressScreen(
                    isPlaceorderScreen: true,
                  ));
            },
            addressName: widget.addressData ?? '',
            text: ctrl.originalAmount.value.toString(),
            //text: ogAmount.toString(),
            placeOrder: () {
              if (widget.addressData == null) {
                Get.snackbar('Dordash', 'Please enter location');
              } else {
                controller.savePlaceOrder(data, widget.addressData ?? '');
              }
            },
            scheduleOrder: () {
              ctrl.showBottomSheetForOrder(
                  context, data, widget.addressData ?? '');
            },
          ),
        );
      }),
    );
  }

  Widget buildInfo({
    required String text,
    required Function()? placeOrder,
    required Function()? scheduleOrder,
    required Function()? selectAddress,
    required String addressName,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 27.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL24),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 13.h),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Padding(
              //               padding: EdgeInsets.only(bottom: 1.v),
              //               child: Text("msg_delivery_address".tr.toUpperCase(),
              //                   style: theme.textTheme.bodyMedium)),
              //           Text("lbl_edit".tr.toUpperCase(),
              //               style: CustomTextStyles.bodyMediumPrimary
              //                   .copyWith(decoration: TextDecoration.underline))
              //         ])),
              SizedBox(height: 12.v),
              Text(addressName ?? ''),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.h),
                child: GestureDetector(
                  onTap: selectAddress,
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Add Location',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 29.v),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 9.v, bottom: 10.v),
                            child: Text("lbl_total".tr.toUpperCase(),
                                style: theme.textTheme.bodyMedium)),
                        Padding(
                            padding: EdgeInsets.only(left: 12.h),
                            child: Text(text,
                                style: CustomTextStyles.headlineLargeGray900)),
                        CustomImageView(
                            imagePath: ImageConstant.imgVector,
                            height: 10.v,
                            width: 5.h,
                            margin: EdgeInsets.only(
                                left: 7.h, top: 14.v, bottom: 12.v))
                      ])),
              SizedBox(height: 31.v),
              Padding(
                padding: EdgeInsets.only(right: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CustomElevatedButton(
                            onPressed: placeOrder,
                            text: "lbl_place_order".tr.toUpperCase(),
                            margin: EdgeInsets.only(right: 3.h))),
                    Expanded(
                        child: CustomOutlinedButton(
                            onPressed: scheduleOrder,
                            text: "lbl_schedule_order".tr.toUpperCase(),
                            margin: EdgeInsets.only(left: 3.h),
                            buttonStyle: CustomButtonStyles.outlinePrimaryTL12))
                  ],
                ),
              ),
              SizedBox(height: 2.v)
            ]));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 69.h,
        leading: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            margin: EdgeInsets.only(left: 24.h, top: 5.v, bottom: 5.v),
            onTap: () {
              Get.back();
              // onTapArrowLeft();
            }),
        title: AppbarSubtitle(
          text: "lbl_cart".tr,
          margin: EdgeInsets.only(left: 10.h),
        ),
        actions: [
          // AppbarSubtitleTwo(
          //     text: "lbl_done".tr.toUpperCase(),
          //     margin: EdgeInsets.fromLTRB(24.h, 21.v, 24.h, 17.v))
        ]);
  }
}
