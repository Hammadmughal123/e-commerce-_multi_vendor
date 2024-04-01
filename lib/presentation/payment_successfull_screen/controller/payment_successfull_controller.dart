import '../../../core/app_export.dart';
import '../../../presentation/payment_successfull_screen/models/payment_successfull_model.dart';

/// A controller class for the PaymentSuccessfullScreen.
///
/// This class manages the state of the PaymentSuccessfullScreen, including the
/// current paymentSuccessfullModelObj
class PaymentSuccessfullController extends GetxController {
  Rx<PaymentSuccessfullModel> paymentSuccessfullModelObj =
      PaymentSuccessfullModel().obs;
}
