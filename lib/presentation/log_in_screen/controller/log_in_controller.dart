import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/app_export.dart';
import '../../../presentation/log_in_screen/models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the LogInScreen.
///
/// This class manages the state of the LogInScreen, including the
/// current logInModelObj
class LogInController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LogInModel> logInModelObj = LogInModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> rememberMe = false.obs;
  final GoogleSignIn signIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> googleSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      print('....................Function start google sign in');
      final GoogleSignInAccount? googleSignInAccount = await signIn.signIn();
      if (googleSignInAccount != null) {
        EasyLoading.show(status: 'Please');
        print(
            '....................googleSignInAccount:${googleSignInAccount.displayName}');

        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(authCredential);
        User? user = userCredential.user;

        if (user != null) {
          prefs.setString('uid', user.uid.toString());
          print(
              '....................googleSignInAccount:${user.email},${prefs.getString('uid')}');
          var ref = await firebaseFirestore
              .collection('users')
              .doc(firebaseAuth.currentUser!.uid)
              .set({
            'name': user.displayName,
            'email': user.email,
            'userId': user.uid,
            'image': user.photoURL,
            'number': user.phoneNumber
          }).then((value) => {
                    EasyLoading.dismiss(),
                    Get.toNamed(AppRoutes.completeProfile),
                    print(
                        '........................you are successfully signin'),
                    Get.snackbar('Dor dash', 'You are successfully sign in')
                  });
        }
      }
    } on FirebaseException catch (error) {
      log('message: $error');

      Get.snackbar('Dor dash', error.message.toString());
    } catch (e) {
      EasyLoading.dismiss();
      print('.........................error in google sign in:$e');
      Get.snackbar('Dor dash', 'Something went wrong');
    }
  }

  // Future<void> userLogin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   final GoogleSignInAccount? googleSignInAccount = await signIn.signIn();

  //   try {
  //     log(' user signup starting');
  //     UserCredential userCredential =
  //         await firebaseAuth.signInWithEmailAndPassword(
  //             email: emailController.text, password: passwordController.text);

  //     if (userCredential.user != null) {
  //       EasyLoading.show();
  //       emailController.clear();
  //       passwordController.clear();
  //       Get.toNamed(AppRoutes.completeProfile);
  //       prefs.setString('uid', userCredential.user!.uid.toString());
  //       print('....................................${prefs.getString('uid')}');
  //       EasyLoading.dismiss();
  //     }
  //   } on FirebaseException catch (error) {
  //     EasyLoading.dismiss();
  //     Get.snackbar('Dor dash', error.message.toString());
  //   } catch (e) {
  //     EasyLoading.dismiss();
  //     log('$e');
  //     Get.snackbar('Dor dash', 'Something went wrong');
  //   }

  Future<void> loginWithFirebase() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      EasyLoading.show();
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      if (userCredential.user != null) {
        sharedPreferences.setString('uid', userCredential.user!.uid);
        Get.snackbar('DorDash', 'You are sucessfully login');
        Get.toNamed(AppRoutes.bottomBarScreen);
        EasyLoading.dismiss();
      } else {
        Get.snackbar('DorDash', 'wrong email and password');
        EasyLoading.dismiss();
      }
    } on FirebaseException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('DorDash', 'Platform Exception');
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('DorDash', 'Something went wrong ');
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
