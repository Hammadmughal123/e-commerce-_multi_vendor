import '../../../core/app_export.dart';
import '../../../presentation/filter_dialog/models/filter_model.dart';

/// A controller class for the FilterDialog.
///
/// This class manages the state of the FilterDialog, including the
/// current filterModelObj
class FilterController extends GetxController {
  Rx<FilterModel> filterModelObj = FilterModel().obs;
}
