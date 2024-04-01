import '../../../core/app_export.dart';import 'package:abu_s_application7/presentation/catagories_screen/models/catagories_model.dart';/// A controller class for the CatagoriesScreen.
///
/// This class manages the state of the CatagoriesScreen, including the
/// current catagoriesModelObj
class CatagoriesController extends GetxController {Rx<CatagoriesModel> catagoriesModelObj = CatagoriesModel().obs;

SelectionPopupModel? selectedDropDownValue;

onSelected(dynamic value) { for (var element in catagoriesModelObj.value.dropdownItemList.value) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}} catagoriesModelObj.value.dropdownItemList.refresh(); } 
 }
