import 'dart:io';

import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/seller_pannel/seller_screens/add_new_seller/model/seller_detail_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../add_new_address_screen/models/add_new_address_model.dart';

class SellerDetailController extends GetxController {
  RxList<File> userStoreImages = <File>[].obs;
  int selectedTile = 0;

  void changeRadio(int? value) {
    selectedTile = value!;
    update();
  }

  final profileFullNameController = TextEditingController();
  final profileEmailController = TextEditingController();
  final profilePhoneNumberController = TextEditingController();
  final profileBioValueController = TextEditingController();
  final appartmentvalueController = TextEditingController();
  final addressController = TextEditingController();
  final streetController = TextEditingController();

  final zipcodeController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  List<String> imageUrls = [];
  final String key = UniqueKey().toString();

  Future<void> hostDetails(String text, String selectedChip) async {
    try {
      print('................................Data save start');

      DocumentReference ref = await firebaseFirestore
          .collection('sellerData')
          .doc(firebaseAuth.currentUser!.uid);
      if (ref.path.isNotEmpty) {
        EasyLoading.show();
        imageUrls = await sellerStoreImages(userStoreImages);
        String address = '';
        switch (selectedChip) {
          case '0':
            address = 'other';
            break;
          case '1':
            address = 'home';
            break;
          case '2':
            address = 'work';
            break;
        }
        SellerDetailModel model = SellerDetailModel(
            key: key,
            storeName: profileFullNameController.text.trim(),
            storeEmail: profileEmailController.text.trim(),
            sellerNumber: profilePhoneNumberController.text.trim(),
            sellerBio: profileBioValueController.text.trim(),
            storeAddress: text,
            selectedChip: address,
            sellerShopImages: imageUrls);
        await ref.set(model.toJson()).then((value) => {
              EasyLoading.dismiss(),
              Get.toNamed(AppRoutes.bottomBarScreen),
              print('.........................data save successfully'),
              Get.snackbar('DorDash', 'Thanks for become a seller '),
            });
      }
    } on FirebaseException catch (a) {
      EasyLoading.dismiss();
      print('................................${a}');
      Get.snackbar('DorDash', a.message.toString());
    } catch (e) {
      EasyLoading.dismiss();
      print('................................${e}');
      Get.snackbar('DorDash', e.toString());
    }
  }

  Future<List<String>> sellerStoreImages(List<File> images) async {
    try {
      var imageUrl;
      for (int i = 0; i < images.length; i++) {
        File fileImage = images[i];
        TaskSnapshot snapshot = await firebaseStorage
            .ref()
            .child('seller_storeImages')
            .child(firebaseAuth.currentUser!.uid)
            .child(DateTime.now().toString())
            .putFile(fileImage, SettableMetadata(contentType: 'image/jpg'));

        imageUrl = await snapshot.ref.getDownloadURL();
        if (imageUrl != null) {
          print('................................${imageUrl}');
          imageUrls.add(imageUrl);
          print('........................$i........${imageUrls}');
        }
      }
      return imageUrls;
    } catch (e) {
      print('................................${e}');
      Get.snackbar('DorDash', e.toString());

      return [];
    }
  }

  Future<void> sellerStoreImage(ImageSource source) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      File imageBytes = File(pickedImage.path);
      userImageCropped(imageBytes);
      update();
    }
  }

  Future<void> userImageCropped(File image) async {
    CroppedFile? userImage =
        await ImageCropper().cropImage(sourcePath: image.path);
    if (userImage != null) {
      userStoreImages.add(File(userImage.path));
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
                        sellerStoreImage(ImageSource.camera);
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
                        sellerStoreImage(ImageSource.gallery);
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
