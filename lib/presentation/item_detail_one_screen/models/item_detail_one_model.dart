import 'chipviewsize_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [item_detail_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ItemDetailOneModel {
  Rx<List<ChipviewsizeItemModel>> chipviewsizeItemList =
      Rx(List.generate(4, (index) => ChipviewsizeItemModel()));
}
