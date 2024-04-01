import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/user_cart_products/controller/user_cart_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../product_detail/model/cart_model.dart';

class UserCartScreen extends StatelessWidget {
  UserCartScreen({Key? key}) : super(key: key);

  final UserCartController userCartController = Get.find<UserCartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.myCartScreen);
                },
                child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: theme.colorScheme.primary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Edit',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.edit, size: 17, color: Colors.white)
                      ],
                    )),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('cartProducts')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('all')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot document = snapshot.data!.docs[index];
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        CartModel cartModel = CartModel.fromJson(data);
                        return GestureDetector(
                          onTap: () {
                            // Get.toNamed(AppRoutes.myCartScreen);
                          },
                          child: Card(
                              elevation: 6,
                              surfaceTintColor: Colors.white,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      width: Get.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) {
                                              return Center(
                                                child:
                                                    CupertinoActivityIndicator(),
                                              );
                                            },
                                            errorWidget: (context, url, error) {
                                              return Center(
                                                  child: Icon(Icons.error));
                                            },
                                            imageUrl: cartModel.productModel!
                                                .productsImage![0]),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Quantity: ${cartModel.numberOfProducts.toString()}',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'price: ${cartModel.totalPrice.toString()}',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              )),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
