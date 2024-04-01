import 'ninetyfour_item_model.dart';
import 'ninetyone_item_model.dart';
import 'eightynine_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [filter_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class FilterModel {
  Rx<List<NinetyfourItemModel>> ninetyfourItemList =
      Rx(List.generate(4, (index) => NinetyfourItemModel()));

  Rx<List<NinetyoneItemModel>> ninetyoneItemList =
      Rx(List.generate(3, (index) => NinetyoneItemModel()));

  Rx<List<EightynineItemModel>> eightynineItemList =
      Rx(List.generate(3, (index) => EightynineItemModel()));
}
