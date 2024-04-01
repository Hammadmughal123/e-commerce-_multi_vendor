import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_export.dart';
import '../../seller_pannel/add_category/model/product_model.dart';

class CustomSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<ProductModel> products = [];
  @override
  void onInit() {
    searchController.addListener(() {
      handleSearch();
    });
    super.onInit();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   searchController.addListener(handleSearch);
  // }

  @override
  void dispose() {
    searchController.removeListener(handleSearch);
    searchController.dispose();
    super.dispose();
  }

  Future<List<ProductModel>> searchProducts(String searchText) async {
    List<ProductModel> products = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      if (querySnapshot.docs.isNotEmpty) {
        products = querySnapshot.docs
            .map((doc) =>
                ProductModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      print("Error searching products: $e");
    }
    return products;
  }

  void handleSearch() async {
    String searchText = searchController.text.trim();
    if (searchText.isNotEmpty) {
      List<ProductModel> searchResults = await searchProducts(searchText);

      products = searchResults;
      update();
      print('.......................products:${products.length}');
    } else {
      // Handle empty search text
    }
  }
}
