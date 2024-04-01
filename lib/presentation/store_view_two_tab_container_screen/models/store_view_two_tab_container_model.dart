import 'thirtytwo_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [store_view_two_tab_container_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class StoreViewTwoTabContainerModel {
  Rx<List<ThirtytwoItemModel>> thirtytwoItemList =
      Rx(List.generate(1, (index) => ThirtytwoItemModel()));
}
