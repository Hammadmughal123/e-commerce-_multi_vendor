import '../../../core/app_export.dart';
import '../../../presentation/offer_dialog/models/offer_model.dart';

/// A controller class for the OfferDialog.
///
/// This class manages the state of the OfferDialog, including the
/// current offerModelObj
class OfferController extends GetxController {
  Rx<OfferModel> offerModelObj = OfferModel().obs;
}
