import '../../../core/app_export.dart';
import '../../../presentation/orders_page/models/orders_model.dart';

/// A controller class for the OrdersPage.
///
/// This class manages the state of the OrdersPage, including the
/// current ordersModelObj
class OrdersController extends GetxController {
  OrdersController(this.ordersModelObj);

  Rx<OrdersModel> ordersModelObj;
}
