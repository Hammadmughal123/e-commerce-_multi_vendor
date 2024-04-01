import 'package:abu_s_application7/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../my_cart_screen/models/place_order_model.dart';

class SellerCartController extends GetxController {
  @override
  void onInit() {
   // getOrdersForVendor();
    // getVendorOrders();
    // TODO: implement onInit
    super.onInit();
  }

  List<PlaceOrderModel> orders = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<void> getVendorOrders() async {
  //   try {
  //     var vendorId =FirebaseAuth.instance.currentUser!.uid;

  //     var querySnapshot = await _firestore
  //         .collection('userPlaceOrders')
  //         .get();

  //     Get.to(() => CartScreen(orders: querySnapshot.docs));
  //   } catch (error) {
  //     print('Error getting vendor orders: $error');
  //     Get.snackbar('DoorDash', 'Failed to get vendor orders');
  //   }
  // }
  // Function to fetch orders for the vendor
 
}
