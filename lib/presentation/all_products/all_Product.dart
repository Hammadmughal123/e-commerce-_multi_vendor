import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/product_detail/product_detail_screen.dart';
import 'package:abu_s_application7/presentation/seller_pannel/add_category/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {
  final List<ProductModel>? categoryProducts;

  const AllProductScreen({Key? key, this.categoryProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryProducts![0].selectedCategory.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 170,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 17),
                itemCount: categoryProducts!.length,
                itemBuilder: (context, index) {
                  var product = categoryProducts![index];
                  return GestureDetector(
                    onTap: () {
                      print('........................on tap');
                      Get.to(() => ProductDetailPage(
                            product: product,
                          ));
                    },
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: product.productsImage![0],
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Text(product.productDetail.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      product.productDetail.toString(),
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.totalPrice.toString(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      product.salePrice.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
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
            ),
          ],
        ),
      ),
    );
  }
}
