import 'package:abu_s_application7/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../selller_cart_product/cart_screen.dart';

class SellerPannelController extends GetxController {
  Future<void> getVendorOrders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Get.to(() => CartScreen(
            vendorId: prefs.getString('sellerID'),
          ));
    } catch (error) {
      EasyLoading.dismiss();

      print('Error getting vendor orders: $error');
      Get.snackbar('DoorDash', 'Failed to get vendor orders');
    }
  }
}
