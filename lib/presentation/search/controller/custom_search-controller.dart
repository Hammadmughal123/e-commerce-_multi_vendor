import 'dart:convert';
import 'dart:developer';
import 'package:abu_s_application7/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../add_new_address_screen/controller/add_new_address_controller.dart';

class LocationSearchController extends GetxController {
 @override
  void onInit() {
    searchTextCtrl.addListener(() {
      onModify();
    });
    super.onInit();
  }

  AddNewAddressController ctrl = Get.find();

  RxList<dynamic> suggestionList = [].obs;
  final TextEditingController searchTextCtrl = TextEditingController();
  String? apiKey = 'AIzaSyBTCzl-cLZEXhtqF8fyalOXLOVBo2hrkDA';
  String groundURL =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';

  final isLoading = false.obs;

  void onModify() {
    fetchSuggestions(searchTextCtrl.text);
  }

  Future<void> fetchSuggestions(String input) async {
    isLoading.value = true;
    String request = '$groundURL?input=$input&key=$apiKey';
    var response = await http.get(Uri.parse(request));
    var responseResult = response.body.toString();

    if (response.statusCode == 200) {
      suggestionList.assignAll(jsonDecode(responseResult)['predictions']);
    } else {
      throw Exception('Failed to fetch suggestions');
    }
    isLoading.value = false;
  }

 Future<void> getLocationSuggestion(dynamic suggestion) async {
    isLoading.value = true;

    // Clear existing markers except user location marker
    List<Marker> userMarkerList = ctrl.markers
        .where((marker) => marker.position == ctrl.userLocation)
        .toList();
    ctrl.markers.clear();
    ctrl.markers.addAll(userMarkerList);

    // Geocode the selected suggestion to get its coordinates
    List<Location> searchLocation =
        await locationFromAddress(suggestion['description']);
    double sLatitude = searchLocation.last.latitude;
    double sLongitude = searchLocation.last.longitude;

    // Create LatLng object for the selected location
    LatLng locationLatLng = LatLng(sLatitude, sLongitude);

    // Add marker for the selected location
    ctrl.addMarker(locationLatLng);

    // Move camera to the selected location
    ctrl.mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: locationLatLng,
          zoom: 15,
        ),
      ),
    );

    // Update address with the selected location's address
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        locationLatLng.latitude,
        locationLatLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String addressString =
            '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
        ctrl.address.value = addressString;
      } else {
        ctrl.address.value = 'Address not found';
      }
    } catch (e) {
      print('......Error retrieving address: $e');
      ctrl.address.value = 'Address not found';
    }

    // Close the search location screen and return the selected location
    Get.back(result: locationLatLng);

    isLoading.value = false;
  }


}
