import 'dart:io';

import 'package:abu_s_application7/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileController extends GetxController {
  final profileBioValueController = TextEditingController();
  final profilePhoneNumberController = TextEditingController();
  final profileFullNameController = TextEditingController();

  FirebaseStorage sto = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Uint8List? userImage;
  //XFile? pickedFile;
  File? fileImage;
  var imageUrl;

  Future<void> pickImage(ImageSource source) async {
    var pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      userImage = await pickedFile.readAsBytes();
      fileImage = File(pickedFile.path);
      _cropImage(File(pickedFile.path));

      update();
    }
  }

  Future<void> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxWidth: 700,
      maxHeight: 700,
    );

    if (croppedFile != null) {
      Uint8List imageBytes = await croppedFile.readAsBytes();
      userImage = imageBytes;
      update();
    }
  }

  Future<void> uploadUserDataInFirebase() async {
    try {
      print('............................Function start');
      if (profileBioValueController.text.isNotEmpty ||
          profilePhoneNumberController.text.isNotEmpty ||
          profileFullNameController.text.isNotEmpty ||
          userImage != null) {
        EasyLoading.show();
        TaskSnapshot ref = await sto
            .ref()
            .child('userImages')
            .child(firebaseAuth.currentUser!.uid)
            .putFile(fileImage!, SettableMetadata(contentType: 'image/jpg'));
        imageUrl = await ref.ref.getDownloadURL();
        print('..............................imageurl:.${imageUrl}');

        if (imageUrl != null) {
          print('..............................imageurl:.${imageUrl}');

          await firebaseFirestore
              .collection('users')
              .doc(firebaseAuth.currentUser!.uid)
              .update({
            'image': imageUrl,
            'fullName': profileFullNameController.text.trim(),
            'bio': profileBioValueController.text.trim(),
            'number': profilePhoneNumberController.text.trim()
          }).then((value) => {
                    EasyLoading.dismiss(),
                    print('...........................data save'),
                    Get.snackbar('Dordash', 'Data successfully save'),
                    Get.toNamed(AppRoutes.locationAccessScreen)
                  });
        }
      } else {
        Get.snackbar('DorDash', 'Please fill the all fields');
      }
    } on FirebaseException catch (error) {
      EasyLoading.dismiss();
      Get.snackbar('DorDash', 'Please check Internet');
    } catch (e) {
      EasyLoading.dismiss();
      print('..............................$e');
      Get.snackbar('DorDash', 'Something went wrong');
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
                        pickImage(ImageSource.camera);
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
                        pickImage(ImageSource.gallery);
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
