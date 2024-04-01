import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/product_detail/controller/product_detail_controller.dart';
import 'package:abu_s_application7/presentation/seller_pannel/add_category/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel? product;
  ProductDetailPage({Key? key, this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ProductDetailController productDetailController =
      Get.put<ProductDetailController>(ProductDetailController());

  @override
  void initState() {
    super.initState();
    try {
      if (widget.product!.salePrice != null) {
        productDetailController.originalProductPrice =
            double.parse(widget.product!.salePrice!);
      }                                                   
    } catch (e) {
      print('Error parsing sale price: $e');
      productDetailController.originalProductPrice = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProductDetailController>(builder: (ctrl) {
        return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CarouselSlider(
                        items: widget.product!.productsImage!.map((image) {
                          return CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return Center(
                                child: CupertinoActivityIndicator(),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return Center(
                                child: Icon(Icons.error),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 200,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 12),
                    child: Row(
                      children: [
                        Text(
                          widget.product!.productDetail.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 12),
                    child: Row(
                      children: [
                        Text(
                          widget.product!.productDescription.toString(),
                          style: TextStyle(
                              color: Colors.black54,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: theme.colorScheme.primary, width: 2)),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, right: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              widget.product!.currency.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 4),
                            child: Text(
                              ctrl.productPrice == 0
                                  ? ctrl.originalProductPrice.toString()
                                  : ctrl.productPrice.toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(17)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ctrl.removeProduct();
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400
                                              .withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15,
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    ctrl.numberOfProducts.value.toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      ctrl.addProduct();
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400
                                              .withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 14, left: 14),
                      child: SizedBox(
                          height: 50,
                          width: Get.width,
                          child: ElevatedButton(
                              onPressed: () {
                                ctrl.saveCartData(
                                    widget.product!,
                                    ctrl.productPrice == 0
                                        ? ctrl.originalProductPrice.toString()
                                        : ctrl.productPrice.toString());
                              },
                              child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold
                                ),
                              ))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }

  Widget bottomBarContainer(
      {required String numberOfProducts,
      Function()? onAddCartButton,
      Function()? onRemoveTap,
      Function()? onAddTap}) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal:
                    BorderSide(color: theme.colorScheme.primary, width: 2)),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      widget.product!.currency.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 4),
                    child: Text(
                      widget.product!.salePrice.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(17)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: onRemoveTap ?? () {},
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 15,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            numberOfProducts,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: onAddTap ?? () {},
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 14, left: 14),
              child: SizedBox(
                  height: 50,
                  width: Get.width,
                  child: ElevatedButton(
                      onPressed: onAddCartButton ?? () {},
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
