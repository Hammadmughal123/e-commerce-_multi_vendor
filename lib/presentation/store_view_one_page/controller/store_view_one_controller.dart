import '../../../core/app_export.dart';
import '../../../presentation/store_view_one_page/models/store_view_one_model.dart';

/// A controller class for the StoreViewOnePage.
///
/// This class manages the state of the StoreViewOnePage, including the
/// current storeViewOneModelObj
class StoreViewOneController extends GetxController {
  StoreViewOneController(this.storeViewOneModelObj);

  Rx<StoreViewOneModel> storeViewOneModelObj;
}
