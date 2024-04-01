import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../all_products/all_Product.dart';
import '../../seller_pannel/add_category/model/product_model.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({
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

        return Expanded(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
           // scrollDirection: Axis.horizontal,
            itemCount: uniqueCategories.length,
            itemBuilder: (context, index) {
              String category = uniqueCategories.elementAt(index);
              return 
            GestureDetector(
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
                      elevation: 6,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:  listProducts
                                                    .firstWhere((product) =>
                                                        product.selectedCategory
                                                            ?.contains(category) ??
                                                        false)
                                                    .productsImage?[0] ??
                                                '',
                                  fit: BoxFit.cover,
                                  // height: 100,
                                  width: Get.width,
                                  placeholder: (context, url) {
                                    return Center(
                                      child: CupertinoActivityIndicator(),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return Icon(Icons.error);
                                  },
                                ),
                              ),
                            ),
          
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      category,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Expanded(
                            //   flex: 1,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(left: 10),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           product.totalPrice.toString(),
                            //           style: TextStyle(
                            //             color: Colors.grey,
                            //             fontSize: 15,
                            //             decoration:
                            //                 TextDecoration.lineThrough,
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: 10,
                            //         ),
                            //         Text(
                            //           product.salePrice.toString(),
                            //           style: TextStyle(
                            //               color: Colors.black,
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // child: Card(
                            //   surfaceTintColor: Colors.white,
                            //   elevation: 4,
                            //   child: Stack(
                            //     clipBehavior: Clip.none,
                            //     children: [
                            //       Positioned(
                            //         top: 54,
                            //         left: 5,
                            //         child: Text(
                            //           category,
                            //           style: TextStyle(
                            //             color: Colors.black,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //       Positioned(
                            //         top: -40,
                            //         left: -2,
                            //         right: -2,
                            //         child: Container(
                            //           width: 100,
                            //           height: 80,
                            //           margin: EdgeInsets.all(10),
                            //           decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(10),
                            //             color: Colors.white,
                            //             image: DecorationImage(
                            //               image: CachedNetworkImageProvider(
                            //                 listProducts
                            //                         .firstWhere((product) =>
                            //                             product.selectedCategory
                            //                                 ?.contains(category) ??
                            //                             false)
                            //                         .productsImage?[0] ??
                            //                     '',
                            //               ),
                            //               fit: BoxFit.cover,
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ]))));
            },
          ),
        );
      },
    );
    // return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    //   stream: FirebaseFirestore.instance.collection('products').snapshots(),
    //   builder: (context, snapshot) {
    //     print('..............................function start');
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     } else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     }
    //     final documents = snapshot.data!.docs;
    //     print(
    //         '....................................document ${snapshot.data!.docs.length}');

    //     List<ProductModel> listProducts = documents
    //         .map((doc) =>
    //             ProductModel.fromJson(doc.data() as Map<String, dynamic>))
    //         .toList();

    //     Set<String> uniqueCategories = Set();
    //     listProducts.forEach((product) {
    //       product.selectedCategory?.split(',').forEach((category) {
    //         uniqueCategories.add(category.trim());
    //       });
    //     });

    //     return SizedBox(
    //       height: 180,
    //       child: GridView.builder(
    //         gridDelegate:
    //             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //         scrollDirection: Axis.vertical,
    //         itemCount: uniqueCategories.length,
    //         itemBuilder: (context, index) {
    //           String category = uniqueCategories.elementAt(index);
    //           return GestureDetector(
    //               onTap: () {
    //                 Get.to(() => AllProductScreen(
    //                       categoryProducts: listProducts
    //                           .where((product) =>
    //                               product.selectedCategory
    //                                   ?.split(',')
    //                                   .contains(category) ??
    //                               false)
    //                           .toList(),
    //                     ));
    //               },
    //               child: Card(
    //                   surfaceTintColor: Colors.white,
    //                   elevation: 6,
    //                   child: Container(
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(10)),
    //                       child: Column(children: [
    //                         Expanded(
    //                           flex: 2,
    //                           child: ClipRRect(
    //                             borderRadius: BorderRadius.circular(10),
    //                             child: CachedNetworkImage(
    //                               imageUrl:  listProducts
    //                                                 .firstWhere((product) =>
    //                                                     product.selectedCategory
    //                                                         ?.contains(category) ??
    //                                                     false)
    //                                                 .productsImage?[0] ??
    //                                             '',
    //                               fit: BoxFit.cover,
    //                               // height: 100,
    //                               width: Get.width,
    //                               placeholder: (context, url) {
    //                                 return Center(
    //                                   child: CupertinoActivityIndicator(),
    //                                 );
    //                               },
    //                               errorWidget: (context, url, error) {
    //                                 return Icon(Icons.error);
    //                               },
    //                             ),
    //                           ),
    //                         ),

    //                         Expanded(
    //                           flex: 1,
    //                           child: Padding(
    //                             padding: const EdgeInsets.only(
    //                                 left: 10, right: 10),
    //                             child: Row(
    //                               children: [
    //                                 Text(
    //                                   category,
    //                                   style: TextStyle(
    //                                     color: Colors.black,
    //                                     fontWeight: FontWeight.bold,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                         // Expanded(
    //                         //   flex: 1,
    //                         //   child: Padding(
    //                         //     padding: const EdgeInsets.only(left: 10),
    //                         //     child: Row(
    //                         //       mainAxisAlignment: MainAxisAlignment.start,
    //                         //       children: [
    //                         //         Text(
    //                         //           product.totalPrice.toString(),
    //                         //           style: TextStyle(
    //                         //             color: Colors.grey,
    //                         //             fontSize: 15,
    //                         //             decoration:
    //                         //                 TextDecoration.lineThrough,
    //                         //           ),
    //                         //         ),
    //                         //         SizedBox(
    //                         //           width: 10,
    //                         //         ),
    //                         //         Text(
    //                         //           product.salePrice.toString(),
    //                         //           style: TextStyle(
    //                         //               color: Colors.black,
    //                         //               fontSize: 17,
    //                         //               fontWeight: FontWeight.bold),
    //                         //         ),
    //                         //       ],
    //                         //     ),
    //                         //   ),
    //                         // ),
    //                         // child: Card(
    //                         //   surfaceTintColor: Colors.white,
    //                         //   elevation: 4,
    //                         //   child: Stack(
    //                         //     clipBehavior: Clip.none,
    //                         //     children: [
    //                         //       Positioned(
    //                         //         top: 54,
    //                         //         left: 5,
    //                         //         child: Text(
    //                         //           category,
    //                         //           style: TextStyle(
    //                         //             color: Colors.black,
    //                         //             fontWeight: FontWeight.bold,
    //                         //           ),
    //                         //         ),
    //                         //       ),
    //                         //       Positioned(
    //                         //         top: -40,
    //                         //         left: -2,
    //                         //         right: -2,
    //                         //         child: Container(
    //                         //           width: 100,
    //                         //           height: 80,
    //                         //           margin: EdgeInsets.all(10),
    //                         //           decoration: BoxDecoration(
    //                         //             borderRadius: BorderRadius.circular(10),
    //                         //             color: Colors.white,
    //                         //             image: DecorationImage(
    //                         //               image: CachedNetworkImageProvider(
    //                         //                 listProducts
    //                         //                         .firstWhere((product) =>
    //                         //                             product.selectedCategory
    //                         //                                 ?.contains(category) ??
    //                         //                             false)
    //                         //                         .productsImage?[0] ??
    //                         //                     '',
    //                         //               ),
    //                         //               fit: BoxFit.cover,
    //                         //             ),
    //                         //           ),
    //                         //         ),
    //                         //       ),
    //                         //     ],
    //                         //   ),
    //                         // ),
    //                       ]))));
    //         },
    //       ),
    //     );
    //   },
    // );
  }
}
