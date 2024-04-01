import 'package:abu_s_application7/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'controller/custom_search-controller.dart';

class SearchLocation extends StatelessWidget {
  SearchLocation({
    Key? key,
  }) : super(key: key);
  final LocationSearchController customSearchController =
      Get.put<LocationSearchController>(LocationSearchController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationSearchController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search Location',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Sen'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: ctrl.searchTextCtrl,
                decoration: InputDecoration(
                  labelText: "Search location",
                  labelStyle: TextStyle(
                    fontFamily: 'Sen',
                    color: theme.colorScheme.secondary,
                  ),
                  // prefixIcon: Image.asset(
                  //   ImageConstant.searchScreen,
                  //   height: 1,
                  //   width: 1,
                  // ),
                  filled: true,
                  fillColor: theme.colorScheme.secondary.withOpacity(0.2),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: theme.colorScheme.secondary),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      ctrl.searchTextCtrl.clear();
                    },
                    child:
                        Icon(Icons.clear, color: theme.colorScheme.secondary),
                  ),
                ),
                onChanged: (value) {
                  ctrl.fetchSuggestions(value);
                },
              ),
              Expanded(
                child: Obx(
                  () => ctrl.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ctrl.suggestionList.isEmpty
                          ? const Center(child: Text('No suggestions found'))
                          : ListView.builder(
                              itemCount: ctrl.suggestionList.length,
                              itemBuilder: (context, index) {
                                final suggestion = ctrl.suggestionList[index];
                                return ListTile(
                                  onTap: () async {
                                    ctrl.getLocationSuggestion(suggestion);
                                  },
                                  title: Text(suggestion['description']),
                                );
                              },
                            ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
