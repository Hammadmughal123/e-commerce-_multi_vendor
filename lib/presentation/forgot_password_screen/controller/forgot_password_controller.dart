import '../../../core/app_export.dart';
import '../../../presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A controller class for the ForgotPasswordScreen.
///
/// This class manages the state of the ForgotPasswordScreen, including the
/// current forgotPasswordModelObj
class ForgotPasswordController extends GetxController {
final  TextEditingController emailController = TextEditingController();

  //Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

  // @override
  // void onClose() {
  //   super.onClose();
  //   emailController.dispose();
  // }

  Future<void> resetPassword(String email) async {
    try {
      print('.........................Function start: reset password  ');
   var data= await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => {
    Get.toNamed(AppRoutes.logInScreen),
      Get.snackbar('Success', 'Password reset email sent!'),
    
      print('.........................Function work successfully ')

      });
    } catch (e) {
      print('.........................Function not work: $e ');

      Get.snackbar('Error', e.toString());
    }
  }
}
