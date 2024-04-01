import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/hive_models/cart_model.dart';
import 'package:abu_s_application7/presentation/product_detail/model/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import '../../seller_pannel/add_category/model/product_model.dart';

class ProductDetailController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  RxInt numberOfProducts = 1.obs;
  double productPrice = 0;
  double originalProductPrice = 0;
  List<CartModel> vendorCarts = [];
  CartModel? model;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void addProduct() {
    numberOfProducts.value++;
    productPrice = originalProductPrice * numberOfProducts.value;
    update();
  }

  void removeProduct() {
    if (numberOfProducts.value > 1) {
      numberOfProducts.value--;
      productPrice = originalProductPrice * numberOfProducts.value;
      ;
      update();
    }
  }

  Future<void> saveCartData(
    ProductModel model,
    String totalPrice,
  ) async {
    try {
      EasyLoading.show();
      String userId = firebaseAuth.currentUser!.uid;
      DocumentReference ref =
          await firebaseFirestore.collection('cartProducts').doc(userId);

      CartModel cartModel = CartModel(
          productModel: model,
          totalPrice: totalPrice.toString(),
          numberOfProducts: numberOfProducts.toString(),
          vendorId: model.vendorId);

      await ref.collection('all').add(cartModel.toJson()).then((value) async {
        var hiveData = Hive.box<SellerCartModel>('sellerCartData');
        SellerCartModel hiveModel = SellerCartModel(
            numberOfProducts: numberOfProducts.toString(),
            totalPrice: totalPrice,
            productImage: model.productsImage);

        hiveData.add(hiveModel);
        if (hiveModel.numberOfProducts != null ||
            hiveModel.totalPrice != null ||
            hiveModel.productImage != null) {
          print(
              '..............................V......${hiveModel.totalPrice}.......${hiveModel.numberOfProducts}   ${hiveModel.productImage}');

          EasyLoading.dismiss();
          Get.back();
          Get.snackbar('DorDash', 'Product add in cart screen');
        }
      });
      // print('..............................V......${vendorCarts.length}');
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('DorDash', 'Something went wrong');
    }
  }
}
