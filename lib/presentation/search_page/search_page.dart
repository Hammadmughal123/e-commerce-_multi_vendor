import 'package:abu_s_application7/presentation/search_page/controller/search_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final CustomSearchController customSearchController =
      Get.find<CustomSearchController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomSearchController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Search Products'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ctrl.searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  // suffixIcon: IconButton(
                  //   icon: Icon(Icons.search),
                  //   onPressed: handleSearch,
                  // ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ctrl.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: ctrl.products[index].productsImage![0]),
                        ),
                      ),
                      title: Text(ctrl.products[index].selectedCategory ?? ''),
                      subtitle: Text(ctrl.products[index].totalPrice ?? ''),
                      // Add more ListTile properties as needed
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
