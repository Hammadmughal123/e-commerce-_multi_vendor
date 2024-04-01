import 'dart:developer';

import 'package:abu_s_application7/presentation/address_screen/models/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../routes/app_routes.dart';
import '../models/address_model.dart';

class AddNewAddressController extends GetxController {
  final TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController appartmentvalueController = TextEditingController();
  RxString address = ''.obs;
  User? user = FirebaseAuth.instance.currentUser;
  LatLng? userLocation;
  RxSet<Marker> markers = <Marker>{}.obs;
  GoogleMapController? mapController;
  int? selectedAddress;
  var data;
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(40.730610, -73.935242), // Coordinates for New York City
    zoom: 13,
  );
  Future<void> changeRadioTile(int value) async {
    selectedAddress = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchAndDisplayMarkers();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (userLocation != null) {
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: userLocation!,
            zoom: 13,
          ),
        ),
      );
      data = userLocation;
    }
    update();
  }

  void navigateToSearchLocationScreen() {
    Get.toNamed(AppRoutes.searchLocation);
    // If you need to pass any data to the search location screen, you can do it here.
  }

  Future<void> saveLocation() async {
    try {
      print('..............................addres save start');
      EasyLoading.show();
      var data = await FirebaseFirestore.instance.collection('allAddress');
      String addressType = '';
      switch (selectedAddress) {
        case 0:
          addressType = 'work';
          break;
        case 1:
          addressType = 'home';
          break;
        case 2:
          addressType = 'other';
          break;
        default:
          addressType = 'other';
      }
      AddressModel model = AddressModel(
          addressName: address.value,
          type: addressType,
          userId: FirebaseAuth.instance.currentUser!.uid);
      await data.add(model.toJson()).then((value) => {
            Get.back(),
            print('..............................addres save successfully'),
            Get.snackbar('DorDash', 'Address save successsfully'),
            EasyLoading.dismiss(),
          });
    } catch (e) {
      print('..............................addres not save:$e');
      EasyLoading.dismiss();
    }
  }

  void receiveSearchedLocation(LatLng location) async {
    markers.clear();
    addMarker(location);

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: 15,
        ),
      ),
    );

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String addressString =
            '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
        address.value = addressString;
      } else {
        address.value = 'Address not found';
      }
    } catch (e) {
      print('......Error retrieving address: $e');
      address.value = 'Address not found';
    }
  }

  void addMarker(LatLng position) {
    String markerIdVal = 'marker_${DateTime.now().millisecondsSinceEpoch}';
    markers.add(
      Marker(
        markerId: MarkerId(markerIdVal),
        position: position!,
      ),
    );

    if (userLocation != null) {
      moveCameraToUserLocation();
      log('User Location: $userLocation');
    }

    update();
  }

  void fetchAndDisplayMarkers() async {
    if (user == null) {
      log('User is not signed in.');
      return;
    }

    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      if (documentSnapshot.exists) {
        var locationData = documentSnapshot.data() as Map<String, dynamic>;
        double latitude = locationData['latitude'];
        double longitude = locationData['longitude'];
        userLocation = LatLng(latitude, longitude);
        initialCameraPosition = CameraPosition(
          target: userLocation!,
          zoom: 13,
        );

        addMarker(userLocation!);
        if (userLocation != null) {
          moveCameraToUserLocation();
        }

        update();
        log('User Location: $userLocation');
      } else {
        log('No location data found in Firestore for user: ${user!.uid}');
      }
    } catch (e) {
      log('An error occurred while fetching the location: $e');
    }
  }

  void moveCameraToUserLocation() {
    if (userLocation != null && mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: userLocation!,
            zoom: 13,
          ),
        ),
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    addressController.dispose();
    streetController.dispose();
    zipcodeController.dispose();
    appartmentvalueController.dispose();
  }
}
