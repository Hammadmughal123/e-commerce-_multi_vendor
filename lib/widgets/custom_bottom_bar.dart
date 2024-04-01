import '../../core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgSettingsBlueGray800,
      activeIcon: ImageConstant.imgSettingsBlueGray800,
      type: BottomBarEnum.Settingsbluegray800,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettings,
      activeIcon: ImageConstant.imgSettings,
      type: BottomBarEnum.Settings,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearch,
      activeIcon: ImageConstant.imgSearch,
      type: BottomBarEnum.Search,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.v,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.primary,
            width: 2.h,
          ),
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Container(
                decoration: AppDecoration.outlineBlack,
                child: CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                  color: appTheme.blueGray800,
                  margin: EdgeInsets.symmetric(vertical: 17.v),
                ),
              ),
              activeIcon: Container(
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                  color: appTheme.blueGray800,
                  margin: EdgeInsets.symmetric(vertical: 8.v),
                ),
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Settingsbluegray800,
  Settings,
  Search,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
