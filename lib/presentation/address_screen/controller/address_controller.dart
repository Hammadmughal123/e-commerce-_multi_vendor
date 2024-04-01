import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/my_cart_screen/my_cart_screen.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_screens/add_new_seller/sellert_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../add_new_address_screen/models/address_model.dart';

class AddressController extends GetxController {
  void saveAddressToCollection(
      AddressModel address, bool placeorder, bool isStore) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      if (placeorder == true) {
        var data;

        print('........................store..$isStore');
        preferences
            .setString('placeOrderAddress', address.addressName.toString())
            .then((value) => {
                  print(
                      '..........................data save in prefresnces${preferences.getString('addressName')}'),
                  data = preferences.getString('placeOrderAddress'),
                  Get.to(MyCartScreen(addressData: data))
                });
        // print('......................placeorder....$placeorder');
        // await FirebaseFirestore.instance.collection('selectedAddress').add({
        //   'userId': FirebaseAuth.instance.currentUser!.uid,
        //   'addressName': address.addressName,
        //   'type': address.type,
        // }).then((value) => {Get.back()});
      }
      if (isStore == true) {
        var data;
        print('........................store..$isStore');
        preferences
            .setString('addressName', address.addressName.toString())
            .then((value) => {
                  print(
                      '..........................data save in prefresnces${preferences.getString('addressName')}'),
                  data = preferences.getString('addressName'),
                  Get.to(SellerDetailScreen(data: data))
                });
        // await FirebaseFirestore.instance
        //     .collection('sellerData')
        //     .doc(
        //       FirebaseAuth.instance.currentUser!.uid,
        //     )
        //     .update({
        //   'userId': FirebaseAuth.instance.currentUser!.uid,
        //   'addressName': address.addressName,
        //   'type': address.type,
        // }).then((value) => {
        //           Get.back(),
        //           print('..........................function work'),
        //         });
      }
    } catch (e) {
      print('...........Error saving address: $e');
    }
  }
}
