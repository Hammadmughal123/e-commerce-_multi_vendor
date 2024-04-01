import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/address_screen/address_screen.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_screens/add_new_seller/controller/seller_detail_controller.dart';
import 'package:abu_s_application7/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/custom_elevated_button.dart';

class SellerDetailScreen extends StatelessWidget {
  final String? data;
  SellerDetailScreen({Key? key, this.data}) : super(key: key);
  final SellerDetailController sellerDetailController =
      Get.put<SellerDetailController>(SellerDetailController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerDetailController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade300),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                )),
          ),
          title: Text('Enter details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 17, left: 17),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "lbl_add_store".tr,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 300,
                            child: Obx(
                              () => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sellerDetailController
                                    .userStoreImages.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      height: 120,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    theme.colorScheme.primary,
                                              ),
                                            ),
                                            child: Image.file(
                                              sellerDetailController
                                                  .userStoreImages[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            right: -10,
                                            top: -9,
                                            child: GestureDetector(
                                              onTap: () {
                                                sellerDetailController
                                                    .userStoreImages
                                                    .removeAt(index);
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              sellerDetailController.imageDailogue(context);
                            },
                            child: Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                color:
                                    theme.colorScheme.primary.withOpacity(0.3),
                                border: Border.all(
                                    color: theme.colorScheme.primary),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_store_name".tr.toUpperCase(),
                    style: CustomTextStyles.bodyMediumBluegray90001_1,
                  ),
                ),
                SizedBox(height: 8.v),
                _buildProfileFullName(),
                SizedBox(height: 23.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_store_email".tr.toUpperCase(),
                    style: CustomTextStyles.bodyMediumBluegray90001_1,
                  ),
                ),
                SizedBox(height: 8.v),
                _buildProfileEmail(),
                SizedBox(height: 23.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_phone_number".tr.toUpperCase(),
                    style: CustomTextStyles.bodyMediumBluegray90001_1,
                  ),
                ),
                SizedBox(height: 8.v),
                _buildProfilePhoneNumber(),
                SizedBox(height: 23.v),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "lbl_bio".tr.toUpperCase(),
                    style: CustomTextStyles.bodyMediumBluegray9000113,
                  ),
                ),
                SizedBox(height: 8.v),
                _buildProfileBioValue(),
                SizedBox(height: 23.v),
                Row(
                  children: [
                    Text(
                      "lbl_address".tr.toUpperCase(),
                      textAlign: TextAlign.start,
                      style: CustomTextStyles.bodyMediumBluegray90001,
                    ),
                  ],
                ),
                SizedBox(height: 8.v),

                GestureDetector(
                  onTap: () async {
                    Get.to(AddressScreen(
                      isStoreDetail: true,
                    ));
                    // Navigate to the search location screen
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appTheme.gray10001),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data??'',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 23.v),
                Row(
                  children: [
                    Text(
                      "lbl_label_as".tr.toUpperCase(),
                      style: CustomTextStyles.bodyMediumBluegray90001,
                    ),
                  ],
                ),
                SizedBox(height: 12.v),
                RadioListTile(
                    title: Text('Other'),
                    value: 0,
                    groupValue: ctrl.selectedTile,
                    onChanged: (int? value) {
                      ctrl.changeRadio(value);
                    }),
                RadioListTile(
                    title: Text('Home'),
                    value: 1,
                    groupValue: ctrl.selectedTile,
                    onChanged: (int? value) {
                      ctrl.changeRadio(value);
                    }),
                RadioListTile(
                    title: Text('Work'),
                    value: 2,
                    groupValue: ctrl.selectedTile,
                    onChanged: (int? value) {
                      ctrl.changeRadio(value);
                      print('............................${ctrl.selectedTile}');
                    }),
                // _buildHomeChipViewSection(),
                SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if (ctrl.profileFullNameController.text.isNotEmpty ||
                        ctrl.imageUrls.isNotEmpty ||
                        ctrl.profileEmailController.text.isNotEmpty ||
                        ctrl.selectedTile == null ||
                        ctrl.profilePhoneNumberController.text.isNotEmpty ||
                        ctrl.profileBioValueController.text.isNotEmpty) {
                      ctrl.hostDetails(data??'', ctrl.selectedTile.toString());
                    } else {
                      Get.snackbar('DorDash', 'Please fill all Information',
                          backgroundColor: Colors.white,
                          duration: Duration(seconds: 6));
                    }
                  },
                  text: "lbl_next".tr.toUpperCase(),
                  margin: EdgeInsets.only(
                    // left: 24.h,
                    // right: 24.h,
                    bottom: 30.v,
                  ),
                  buttonTextStyle: theme.textTheme.titleMedium!,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildProfileFullName() {
    return CustomTextFormField(
      controller: sellerDetailController.profileFullNameController,
      hintText: "lbl_jon_bro".tr,
      hintStyle: CustomTextStyles.bodyMediumGray60003,
    );
  }

  /// Section Widget
  Widget _buildProfileEmail() {
    return CustomTextFormField(
      controller: sellerDetailController.profileEmailController,
      hintText: "msg_hello_operator_co".tr,
      hintStyle: CustomTextStyles.bodyMediumGray60003,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        // if (value == null || (!isValidEmail(value, isRequired: true))) {
        //   return "err_msg_please_enter_valid_email".tr;
        // }
        return null;
      },
    );
  }

  /// Section Widget

  /// Section Widget
  Widget _buildProfilePhoneNumber() {
    return CustomTextFormField(
      controller: sellerDetailController.profilePhoneNumberController,
      hintText: "lbl_408_841_0926".tr,
      hintStyle: CustomTextStyles.bodyMediumGray60003,
    );
  }

  /// Section Widget
  Widget _buildProfileBioValue() {
    return CustomTextFormField(
      controller: sellerDetailController.profileBioValueController,
      hintText: "msg_eat_good".tr,
      hintStyle: CustomTextStyles.bodyMediumGray60003,
      textInputAction: TextInputAction.done,
      maxLines: 5,
    );
  }
}
