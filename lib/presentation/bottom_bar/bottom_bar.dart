import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/image_constant.dart';
import '../../routes/app_routes.dart';
import '../../theme/theme_helper.dart';
import '../home_page/home_page.dart';
import '../orders_tab_container_page/orders_tab_container_page.dart';
import '../pickup_page/pickup_page.dart';
import '../settings_screen/settings_screen.dart';
import 'bottom_bar_controller.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  final BottomBarController bottomBarController =
      Get.put<BottomBarController>(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('sellerData')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData) {
              return Text('.........No data found');
            }

            var docSnapshot = snapshot.data as DocumentSnapshot;
            if (!docSnapshot.exists) {
              return SizedBox.shrink();
            }
                                                                                
            // Use data() method without force-unwrapping
            var data = docSnapshot.data();

            if (data != null) {
              return FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: theme.colorScheme.primary,
                onPressed: () {
                  Get.toNamed(AppRoutes.addCategoryScreen);
                },
                child: Icon(Icons.add),
              );
            }

            // Continue with the rest of your code using the 'data' variable...

            return SizedBox();
          },
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              //   selectedItemColor: bottomBarController.,
              currentIndex: bottomBarController.selectIndex.value,
              onTap: (value) {
                bottomBarController.changeIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                    icon: bottomBarController.selectIndex.value == 0
                        ? Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Image.asset(ImageConstant.selectedHome),
                          )
                        : Image.asset(
                            ImageConstant.home,
                            height: 60,
                            width: 60,
                          ),
                    label: '',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                  icon: bottomBarController.selectIndex.value == 1
                      ? Image.asset(ImageConstant.selectedPickup)
                      : Image.asset(
                          ImageConstant.pickup,
                          height: 60,
                          width: 60,
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: bottomBarController.selectIndex.value == 2
                      ? Image.asset(ImageConstant.selectedOrder)
                      : Image.asset(
                          ImageConstant.order,
                          height: 60,
                          width: 60,
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: bottomBarController.selectIndex.value == 3
                      ? Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Image.asset(ImageConstant.selectedSetting),
                        )
                      : Image.asset(
                          ImageConstant.setting,
                          height: 60,
                          width: 60,
                        ),
                  label: '',
                ),
              ]),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: bottomBarController.tabController,
          children: [
            HomePage(),
            PickupPage(),
            OrdersTabContainerPage(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
