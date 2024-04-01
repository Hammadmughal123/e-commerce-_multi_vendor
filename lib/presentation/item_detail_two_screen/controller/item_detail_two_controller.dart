import '../../../core/app_export.dart';
import '../../../presentation/item_detail_two_screen/models/item_detail_two_model.dart';

/// A controller class for the ItemDetailTwoScreen.
///
/// This class manages the state of the ItemDetailTwoScreen, including the
/// current itemDetailTwoModelObj
class ItemDetailTwoController extends GetxController {
  Rx<ItemDetailTwoModel> itemDetailTwoModelObj = ItemDetailTwoModel().obs;
}
