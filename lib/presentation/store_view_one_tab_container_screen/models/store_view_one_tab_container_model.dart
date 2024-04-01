import 'twentyfive_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [store_view_one_tab_container_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class StoreViewOneTabContainerModel {
  Rx<List<TwentyfiveItemModel>> twentyfiveItemList =
      Rx(List.generate(2, (index) => TwentyfiveItemModel()));
}
