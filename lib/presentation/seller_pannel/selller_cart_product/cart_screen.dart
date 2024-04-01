import 'package:abu_s_application7/presentation/my_cart_screen/models/place_order_model.dart';
import 'package:abu_s_application7/presentation/my_cart_screen/models/schedule_order_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/seller_cart_controller.dart';

class CartScreen extends StatefulWidget {
  final String? vendorId;

  CartScreen({
    Key? key,
    this.vendorId,
  }) : super(key: key);

  final SellerCartController sellerCartController =
      Get.put<SellerCartController>(SellerCartController());

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order'),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Place Order'),
                  Tab(text: 'Schedule Order'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Place Order Tab
                    PlaceOrderTab(vendorId: widget.vendorId),
                    // Schedule Order Tab
                    ScheduleOrderTab(vendorId: widget.vendorId),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceOrderTab extends StatelessWidget {
  final String? vendorId;

  PlaceOrderTab({Key? key, this.vendorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('userPlaceOrders')
          .where('sellerId', isEqualTo: vendorId)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No orders yet.'),
          );
        }
        final document = snapshot.data!.docs;
        return ListView.builder(
          itemCount: document.length,
          itemBuilder: (context, index) {
            var orderData = document[index].data();
            PlaceOrderModel placeOrderModel =
                PlaceOrderModel.fromJson(orderData as Map<String, dynamic>);

            return ExpansionTile(
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide.none,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide.none,
                ),
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'TotalPrice: ${placeOrderModel.totalPrice}',
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                trailing: Text('Delivered'),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        placeOrderModel.cartModel.productModel!.productDetail ??
                            ''),
                    Text(
                      placeOrderModel.address ?? '',
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                leading: Container(
                  height: 70,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: placeOrderModel
                            .cartModel.productModel!.productsImage![0]),
                  ),
                ));
          },
        );
      },
    );
  }
}

class ScheduleOrderTab extends StatelessWidget {
  final String? vendorId;

  ScheduleOrderTab({Key? key, this.vendorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement your UI for scheduling orders here
    return Column(
      children: [
        StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('scheduleOrders')
              .where('sellerId', isEqualTo: vendorId)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty || !snapshot.hasData) {
              return Center(
                child: Text('No order found'),
              );
            }
            print('..........................${snapshot.data!.docs}');

            final List<DocumentSnapshot> dataList = snapshot.data!.docs;
            print('..........................${dataList.length}');
            return Expanded(
                child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                var data = dataList[index].data();
                ScheduleOrderModel scheduleOrderModel =
                    ScheduleOrderModel.fromJson(data as Map<String, dynamic>);
                return ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none,
                    ),
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'TotalPrice: ${scheduleOrderModel.originalamount}',
                                    textAlign: TextAlign.start,
                                  ),
                                  Text(scheduleOrderModel.address)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                    trailing: Text('Delivered'),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(scheduleOrderModel
                                .model.productModel!.productDetail ??
                            ''),
                        Text(
                          scheduleOrderModel.date ?? '',
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    leading: Container(
                      height: 70,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: scheduleOrderModel
                                .model.productModel!.productsImage![0]),
                      ),
                    ));
              },
            ));
          },
        )
      ],
    );
  }
}
