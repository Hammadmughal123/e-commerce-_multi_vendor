import '../../../core/app_export.dart';
import '../../../presentation/payment_method_page/models/payment_method_model.dart';

/// A controller class for the PaymentMethodPage.
///
/// This class manages the state of the PaymentMethodPage, including the
/// current paymentMethodModelObj
class PaymentMethodController extends GetxController {
  PaymentMethodController(this.paymentMethodModelObj);

  Rx<PaymentMethodModel> paymentMethodModelObj;
}
