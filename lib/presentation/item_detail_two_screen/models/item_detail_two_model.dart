import 'quality_item_model.dart';import '../../../core/app_export.dart';/// This class defines the variables used in the [item_detail_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ItemDetailTwoModel {Rx<List<QualityItemModel>> qualityItemList = Rx(List.generate(4,(index) =>QualityItemModel()));

 }
