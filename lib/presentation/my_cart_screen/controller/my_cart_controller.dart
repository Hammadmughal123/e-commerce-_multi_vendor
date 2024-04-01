import 'package:abu_s_application7/presentation/my_cart_screen/models/place_order_model.dart';
import 'package:abu_s_application7/presentation/product_detail/model/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../models/schedule_order_model.dart';

class MyCartController extends GetxController {
  TextEditingController addressController = TextEditingController();
  Rx<double> originalAmount = 0.0.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  Map<String, dynamic>? address;
  double numberOfProducts = 1;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void updateTotalAmount(double amount) {
    originalAmount.value = amount;
  }

  Future<void> savePlaceOrder(CartModel cartModel, String address) async {
    try {
      EasyLoading.show();

      var orderRef = firebaseFirestore.collection('userPlaceOrders');

      PlaceOrderModel model = PlaceOrderModel(
          userId: FirebaseAuth.instance.currentUser!.uid,
          address: address,
          cartModel: cartModel,
          sellerId: cartModel.productModel!.vendorId.toString(),
          totalPrice: originalAmount.toString());
      await orderRef.add(model.toJson());

      Get.toNamed(AppRoutes.bottomBarScreen);
      Get.snackbar('DoorDash', 'Your order placed');
      var cartRef = firebaseFirestore
          .collection('cartProducts')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('all');
      var querySnapshot = await cartRef
          .where('totalPrice', isEqualTo: cartModel.totalPrice)
          .get();

      print(
          '.........................delete start${querySnapshot.docs.length}');
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
        print('.........................delete successfully');
      }
      EasyLoading.dismiss();
      Get.toNamed(AppRoutes.bottomBarScreen);
    } catch (error) {
      EasyLoading.dismiss();
      print('Error placing order: $error');
      Get.snackbar('DoorDash', 'Failed to place order');
    }
  }

  Future<void> showBottomSheetForOrder(
      BuildContext context, CartModel model, String address) async {
    return showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 7, 22, 35),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: [
              Text(
                'Schedule Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Date:',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate.value,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (picked != null && picked != selectedDate) {
                        selectedDate.value = picked;
                        update();
                      }
                    },
                    child: Obx(
                      () => Text(
                        '${selectedTime.value.format(context)}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Time:',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: selectedTime.value,
                      );
                      if (picked != null && picked != selectedTime) {
                        selectedTime.value = picked;
                        update();
                      }
                    },
                    child: Obx(
                      () => Text(
                        '${selectedTime.value.format(context)}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              //  SizedBox(height: 20.0),
              SizedBox(
                height: 50,
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    if (address.isNotEmpty) {
                      saveScheduleOrderInFirebase(model, selectedDate.value,
                          selectedTime.value, address);
                    } else {
                      Get.snackbar('DorDash', 'Please enter Locatio');
                    }
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> saveScheduleOrderInFirebase(CartModel cartModel,
      DateTime selectedDate, TimeOfDay selectedTime, String address) async {
    try {
      EasyLoading.show();
      print('........................function start');
      var ref = await firebaseFirestore.collection('scheduleOrders');

      ScheduleOrderModel model = ScheduleOrderModel(
          sellerId: cartModel.productModel!.vendorId.toString(),
          model: cartModel,
          originalamount: originalAmount.toString(),
          numberOfProducts: numberOfProducts.toString(),
          address: address,
          time: selectedTime.toString(),
          date: selectedDate.toString());

      if (model.date.isNotEmpty || model.time.isNotEmpty) {
        await ref.add(model.toJson());

        var cartRef = firebaseFirestore
            .collection('cartProducts')
            .doc(firebaseAuth.currentUser!.uid)
            .collection('all');
        var querySnapshot = await cartRef
            .where('totalPrice', isEqualTo: cartModel.totalPrice)
            .get();

        print(
            '.........................delete start${querySnapshot.docs.length}');
        for (var doc in querySnapshot.docs) {
          await doc.reference.delete();
          print('.........................delete successfully');
        }

        EasyLoading.dismiss();
        print('....................schedule order....function work');
        Get.toNamed(AppRoutes.bottomBarScreen);
      }
    } catch (e) {
      print('........................error:..$e');
      EasyLoading.dismiss();
    }
  }
}
