import 'package:abu_s_application7/presentation/add_new_address_screen/models/address_model.dart';
import 'package:abu_s_application7/presentation/address_screen/controller/address_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton_three.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AddressScreen extends StatelessWidget {
  final bool? isPlaceorderScreen;
  final bool? isStoreDetail;
  AddressScreen({Key? key, this.isPlaceorderScreen, this.isStoreDetail})
      : super(
          key: key,
        );
  final AddressController addressController =
      Get.put<AddressController>(AddressController());

  @override
  Widget build(BuildContext context) {
    print('..............................isPlaceorder..${isPlaceorderScreen}');
    print('.............................isStoreDetail...${isStoreDetail}');

    return SafeArea(
      child: GetBuilder<AddressController>(builder: (ctrl) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 30.v),
            child: Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('allAddress')
                      .where('userId',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text('no address found'),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.hasError.toString()),
                      );
                    }
                    print(
                        '..............................${snapshot.data!.docs}');
                    final List<DocumentSnapshot> listData = snapshot.data!.docs;
                    print('..............................${listData.length}');

                    return Expanded(
                      child: ListView.builder(
                        itemCount: listData.length,
                        itemBuilder: (context, index) {
                          var addressData = listData[index].data();
                          AddressModel model = AddressModel.fromJson(
                              addressData as Map<String, dynamic>);
                          return Card(
                              elevation: 4,
                              child: ListTile(
                                onTap: () {
                                  ctrl.saveAddressToCollection(model,
                                      isPlaceorderScreen??false, isStoreDetail??false);
                                },
                                trailing: Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () async {
                                          await FirebaseFirestore.instance
                                              .collection('allAddress')
                                              .doc(listData[index].id)
                                              .delete();
                                        },
                                        child: Icon(Icons.delete)),
                                    Icon(Icons.edit)
                                  ],
                                ),
                                leading: Text(model.type.toString()),
                                tileColor: Colors.white,
                                title: Center(
                                    child: Text(model.addressName ?? '')),
                              ));
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          bottomNavigationBar: _buildAddNewAddress(),
        );
      }),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: AppbarLeadingIconbuttonThree(
        imagePath: ImageConstant.imgClockBlueGray500145x45,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 5.v,
          bottom: 5.v,
        ),
      ),
      title: AppbarTitle(
        text: "lbl_my_address".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
    );
  }

  Widget _buildAddNewAddress() {
    return CustomElevatedButton(
      onPressed: () {
        Get.toNamed(AppRoutes.addNewAddressScreen);
      },
      text: "lbl_add_new_address".tr.toUpperCase(),
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 30.v,
      ),
    );
  }
}
