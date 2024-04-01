import '../../../core/app_export.dart';
import '../../personal_profiles_screen/models/personal_profiles_model.dart';

/// A controller class for the PersonalProfilesScreen.
///
/// This class manages the state of the PersonalProfilesScreen, including the
/// current personalProfilesModelObj
class StoreInfoController extends GetxController {
  Rx<PersonalProfilesModel> personalProfilesModelObj =
      PersonalProfilesModel().obs;
}
