import '../../../core/app_export.dart';
import '../../../presentation/call_scrren_bottomsheet/models/call_scrren_model.dart';

/// A controller class for the CallScrrenBottomsheet.
///
/// This class manages the state of the CallScrrenBottomsheet, including the
/// current callScrrenModelObj
class CallScrrenController extends GetxController {
  Rx<CallScrrenModel> callScrrenModelObj = CallScrrenModel().obs;
}
