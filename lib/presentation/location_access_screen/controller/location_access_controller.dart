import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LocationAccessController extends GetxController {
  final CollectionReference driversCollection =
      FirebaseFirestore.instance.collection('users');
  FirebaseAuth userId = FirebaseAuth.instance;

  Future<void> requestPermissionAndUpdateLocation() async {
    try {
      print('............................function start');
      PermissionStatus permission = await Permission.location.request();
      if (permission == PermissionStatus.granted) {
        print('............................${permission.isGranted}');
        await updateLocation().then((value) => {
              print('...............function work'),
              Get.toNamed(AppRoutes.bottomBarScreen)
            });
      } else {
        Get.snackbar('Permission Error', 'Location permission denied');
      }
    } catch (e) {
      print('...............................$e');
    }
  }

  Future<void> updateLocation() async {
    try {
      print('............................getting current location');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('............................success${position.latitude}');

      // String userId = // Get current user's ID here, using your authentication method
      if (userId.currentUser!.uid != null) {
        await driversCollection.doc(userId.currentUser!.uid).update({
          'latitude': position.latitude,
          'longitude': position.longitude,
        });
      }
    } catch (e) {
      print('..............................$e');
    }
  }
}
