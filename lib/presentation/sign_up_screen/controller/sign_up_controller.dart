import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/app_export.dart';
import '../../../presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  Rx<bool> rememberMe = false.obs;
  TextEditingController nameFieldController = TextEditingController();

  TextEditingController emailFieldController = TextEditingController();

  TextEditingController passwordFieldController = TextEditingController();

  TextEditingController retypePasswordFieldController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  Future<void> userRegisterInFirebase() async {
    try {
      EasyLoading.show();

      log(' user signup starting');
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: emailFieldController.text,
              password: passwordFieldController.text);

      if (userCredential.user != null) {
        var ref = firebaseFirestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .set({
          'name': nameFieldController.text,
          'email': emailFieldController.text,
          'password': passwordFieldController.text
        }).then((value) => {
                  nameFieldController.clear(),
                  emailFieldController.clear(),
                  passwordFieldController.clear(),
                  retypePasswordFieldController.clear(),
                  Get.toNamed(AppRoutes.completeProfile)
                });
        EasyLoading.dismiss();
      }
    } on FirebaseException catch (error) {
      EasyLoading.dismiss();
      Get.snackbar('Dor dash', error.message.toString());
    } catch (e) {
      EasyLoading.dismiss();
      log('$e');
      Get.snackbar('Dor dash', 'Something went wrong');
    }

    @override
    void onClose() {
      super.onClose();
      nameFieldController.dispose();
      emailFieldController.dispose();
      passwordFieldController.dispose();
      retypePasswordFieldController.dispose();
    }
  }
}
