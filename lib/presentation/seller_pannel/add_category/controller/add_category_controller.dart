import 'dart:io';
import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/seller_pannel/add_category/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AddCategoryController extends GetxController {
  List<String> currencyList = ['\$', '€'];
  String selectedCurrencyType = '€';
  // List<String> conditionList = ['ksj', 'hsdgjs', '00'];
  // String selectedConditionType = '00';
  RxList<File> imageProductList = <File>[].obs;
  List<String> imageUrls = [];
  String selectedCategory = 'Clothes';
  String _productKey = UniqueKey().toString();

  final categoryController = TextEditingController();
  final addDetailController = TextEditingController();
  final priceController = TextEditingController();
  final salePriceController = TextEditingController();
  final desController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  String uid = Uuid().v4();

  Future<void> saveDataInFirebase(int? stock) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      print('.......................function start');
      var productsCollection = await firebaseFirestore.collection('products');
      // .doc(firebaseAuth.currentUser!.uid)
      // .collection(selectedCategory);
      var thisUserCollection = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid);

      print('.......................function work');

      EasyLoading.show();
      imageUrls = await saveImageInFirebase(imageProductList);

      ProductModel model = ProductModel(
          productKey: _productKey,
          selectedCategory: selectedCategory,
          productDetail: addDetailController.text.trim(),
          totalPrice: priceController.text.trim(),
          salePrice: salePriceController.text.trim(),
          productDescription: desController.text.trim(),
          currency: selectedCurrencyType,
          // condition: selectedConditionType,
          productsImage: imageUrls,
          vendorId: uid,
          stock: stock);
      await productsCollection.add(model.toJson()).then((value) => {
            pref.setString('sellerID', uid),
            thisUserCollection.update({
              'my_products': FieldValue.arrayUnion([model.toJson()])
            }),
            Get.snackbar('DorDash', 'Your product add'),
            addDetailController.clear(),
            categoryController.clear(),
            desController.clear(),
            priceController.clear(),
            imageUrls == [],
            salePriceController.clear(),
            selectedCurrencyType == null,
            print(
                '......................................data save     ${pref.getString('sellerID')}'),
            EasyLoading.dismiss()
          });
    }

    //.add({});
    on FirebaseException catch (a) {
      print('..............................${a.message}');
      Get.snackbar('DorDash', a.message.toString());
    } catch (e) {
      EasyLoading.dismiss();
      print('...................................$e');
      Get.snackbar('DorDash', e.toString());
    }
  }

  Future<List<String>> saveImageInFirebase(List<File> images) async {
    try {
      for (int i = 0; i < images.length; i++) {
        File imageFile = images[i];

        TaskSnapshot snapshot = await storage
            .ref()
            .child('productImages')
            .child(firebaseAuth.currentUser!.uid)
            .child(DateTime.now().toString())
            .putFile(imageFile, SettableMetadata(contentType: 'image/jpg'));

        var downloadURL = await snapshot.ref.getDownloadURL();
        print(
            '.......................Image $i uploaded. Download URL: $downloadURL');
        imageUrls.add(downloadURL);
      }
      return imageUrls;
    } catch (e) {
      print('.....................Error uploading images: $e');
      return [];
    }
  }

  Future<void> productImage(ImageSource source) async {
    var imag = await ImagePicker().pickImage(source: source);

    if (imag != null) {
      cropProductImage(File(imag.path));
      update();
    }
  }

  Future<void> cropProductImage(File imageFile) async {
    CroppedFile? cropImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);

    if (cropImage != null) {
      File imaByrtes = File(cropImage.path);
      imageProductList.add(imaByrtes);
    }
  }

  Future<void> imageDailogue(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (
          context,
        ) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Image from',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        productImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            size: 35,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Camera',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        productImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.collections_bookmark,
                            size: 35,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
