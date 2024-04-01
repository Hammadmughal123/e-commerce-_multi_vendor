import '../../../core/app_export.dart';
import '../../../presentation/payment_method_one_page/models/payment_method_one_model.dart';

/// A controller class for the PaymentMethodOnePage.
///
/// This class manages the state of the PaymentMethodOnePage, including the
/// current paymentMethodOneModelObj
class PaymentMethodOneController extends GetxController {
  PaymentMethodOneController(this.paymentMethodOneModelObj);

  Rx<PaymentMethodOneModel> paymentMethodOneModelObj;
}
