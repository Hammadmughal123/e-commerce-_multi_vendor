import '../../../core/app_export.dart';

/// This class is used in the [homechipviewsection_item_widget] screen.
class HomechipviewsectionItemModel {
  Rx<String>? home = Rx("Home");
  Rx<String>? work = Rx("Work");
  Rx<String>? other = Rx("other");

  Rx<bool>? isSelected = Rx(false);
}
