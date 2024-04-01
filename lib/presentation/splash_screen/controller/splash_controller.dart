import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';
import '../../../presentation/splash_screen/models/splash_model.dart';

/// A controller class for the SplashScreen.
///
/// This class manages the state of the SplashScreen, including the
/// current splashModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onInit() {

    Future.delayed(const Duration(milliseconds: 3000), () {
      //Get.toNamed(AppRoutes.onboardingOneScreen);
      checkUserUid();
    });
  }


  Future<void> checkUserUid()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey('uid')){
      Get.offAllNamed(AppRoutes.bottomBarScreen);
    }else{
      Get.offAllNamed(AppRoutes.onboardingOneScreen);
    }

  }
}
