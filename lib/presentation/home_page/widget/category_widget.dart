import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../all_products/all_Product.dart';
import '../../seller_pannel/add_category/model/product_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        print('..............................function start');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final documents = snapshot.data!.docs;
        print(
            '....................................document ${snapshot.data!.docs.length}');

        List<ProductModel> listProducts = documents
            .map((doc) =>
                ProductModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();

        // Extract unique categories
        Set<String> uniqueCategories = Set();
        listProducts.forEach((product) {
          product.selectedCategory?.split(',').forEach((category) {
            uniqueCategories.add(category.trim());
          });
        });

        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: uniqueCategories.length,
            itemBuilder: (context, index) {
              String category = uniqueCategories.elementAt(index);
              return SizedBox(
                height: 100,
                width: 120,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => AllProductScreen(
                          categoryProducts: listProducts
                              .where((product) =>
                                  product.selectedCategory
                                      ?.split(',')
                                      .contains(category) ??
                                  false)
                              .toList(),
                        ));
                  },
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 4,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 54,
                          left: 5,
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -40,
                          left: -2,
                          right: -2,
                          child: Container(
                            width: 100,
                            height: 80,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  listProducts
                                          .firstWhere((product) =>
                                              product.selectedCategory
                                                  ?.contains(category) ??
                                              false)
                                          .productsImage?[0] ??
                                      '',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
