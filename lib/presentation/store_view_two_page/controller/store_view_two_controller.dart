import '../../../core/app_export.dart';
import '../../../presentation/store_view_two_page/models/store_view_two_model.dart';

/// A controller class for the StoreViewTwoPage.
///
/// This class manages the state of the StoreViewTwoPage, including the
/// current storeViewTwoModelObj
class StoreViewTwoController extends GetxController {
  StoreViewTwoController(this.storeViewTwoModelObj);

  Rx<StoreViewTwoModel> storeViewTwoModelObj;
}
