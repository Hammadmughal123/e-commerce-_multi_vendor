import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/app_export.dart';
import '../../../presentation/settings_screen/models/settings_model.dart';

/// A controller class for the SettingsScreen.
///
/// This class manages the state of the SettingsScreen, including the
/// current settingsModelObj
class SettingsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Rx<SettingsModel> settingsModelObj = SettingsModel().obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Uint8List? userImage;

  // Future<void> getUserDataFromFirebase() async {
  //   try {
  //   var ref = await firebaseFirestore
  //         .collection('users')
  //         .doc(firebaseAuth.currentUser!.uid)
  //         .get();

  //     print('..............................${ref['name']}');
  //   } catch (e) {
  //     print('................................$e');
  //   }
  // }
 

}
