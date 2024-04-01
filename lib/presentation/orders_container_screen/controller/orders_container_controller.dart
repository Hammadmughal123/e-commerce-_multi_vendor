import '../../../core/app_export.dart';
import '../../../presentation/orders_container_screen/models/orders_container_model.dart';

/// A controller class for the OrdersContainerScreen.
///
/// This class manages the state of the OrdersContainerScreen, including the
/// current ordersContainerModelObj
class OrdersContainerController extends GetxController {
  Rx<OrdersContainerModel> ordersContainerModelObj = OrdersContainerModel().obs;
}
