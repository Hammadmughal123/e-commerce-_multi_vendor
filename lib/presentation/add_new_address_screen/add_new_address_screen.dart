// AddNewAddressScreen.dart

import 'package:abu_s_application7/presentation/address_screen/controller/address_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/add_new_address_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AddNewAddressController>(
        init: AddNewAddressController(),
        builder: (ctrl) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 295.v,
                        width: double.maxFinite,
                        child: GoogleMap(
                          onMapCreated: ctrl.onMapCreated,
                          initialCameraPosition: ctrl.initialCameraPosition,
                          markers: ctrl.markers,
                          mapToolbarEnabled: false,
                          zoomControlsEnabled: false,
                          gestureRecognizers: <Factory<
                              OneSequenceGestureRecognizer>>{
                            Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer(),
                            ),
                          },
                        ),
                      ),
                      SizedBox(height: 29.v),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.searchLocation);
                            },
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
                                  'Search Location',
                                  style: TextStyle(
                                    color: theme.colorScheme.primary,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      RadioListTile(
                          title: Text('work'),
                          value: 0,
                          groupValue: ctrl.selectedAddress,
                          onChanged: (int? val) {
                            ctrl.changeRadioTile(val!);
                          }),
                      RadioListTile(
                          title: Text('home'),
                          value: 1,
                          groupValue: ctrl.selectedAddress,
                          onChanged: (int? val) {
                            ctrl.changeRadioTile(val!);
                          }),
                      RadioListTile(
                          title: Text('other'),
                          value: 2,
                          groupValue: ctrl.selectedAddress,
                          onChanged: (int? val) {
                            ctrl.changeRadioTile(val!);
                          }),
                      // if (ctrl.selectedAddress == 2)
                      // SizedBox(
                      //   height: 40,
                      //   child: Card(
                      //     elevation: 3,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 10,right: 10),
                      //       child: TextFormField(
                      //         controller: ctrl.addressController,
                      //         decoration: InputDecoration(
                      //             border: OutlineInputBorder(
                      //                 borderRadius: BorderRadius.circular(10))),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: _buildSaveLocationButtonSection(
                ctrl: ctrl,
                onPressed: () {
                  ctrl.saveLocation();
                }),
            persistentFooterButtons: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(() => Column(
                      children: [
                        Text(
                          ctrl.address.value ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        Column(children: [
                          if (ctrl.selectedAddress == 0)
                            Text(
                              'work',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          if (ctrl.selectedAddress == 1)
                            Text(
                              'home',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          if (ctrl.selectedAddress == 2)
                            Text(
                              'other',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )
                        ]
                            //  int.parse(ctrl!.selectedAddress!).toString(),

                            ),
                      ],
                    )),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget customRadioTile({
    required String title,
    required int value,
    required int groupValue,
    required Function(int?) onChanged,
  }) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          //   SizedBox(width: 2), // Adjust the spacing as needed
          Text(
            title,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveLocationButtonSection(
      {required AddNewAddressController ctrl,
      required void Function()? onPressed}) {
    return CustomElevatedButton(
        text: "lbl_save_location".tr.toUpperCase(),
        margin: EdgeInsets.only(
          left: 24.h,
          right: 24.h,
          bottom: 30.v,
        ),
        onPressed: onPressed ?? () {});
  }
}
