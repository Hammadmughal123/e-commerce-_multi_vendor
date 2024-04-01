// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

// import '../product_detail/model/cart_model.dart';
// import 'controller/orders_controller.dart';
// import 'models/orders_model.dart';
// import '../../core/app_export.dart';
// import '../../widgets/custom_elevated_button.dart';
// import 'package:flutter/material.dart';

// class OngoingOrder extends StatelessWidget {
//   OngoingOrder({Key? key})
//       : super(
//           key: key,
//         );

//   OrdersController controller = Get.put(OrdersController(OrdersModel().obs));

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('cartProducts')
//                       .doc(FirebaseAuth.instance.currentUser!.uid)
//                       .collection('all')
//                       .snapshots(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     }

//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     }

//                     return GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 10.0,
//                         mainAxisSpacing: 10.0,
//                       ),
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         DocumentSnapshot document = snapshot.data!.docs[index];
//                         Map<String, dynamic> data =
//                             document.data() as Map<String, dynamic>;
//                         CartModel cartModel = CartModel.fromJson(data);
//                         return Card(
//                             elevation: 6,
//                             surfaceTintColor: Colors.white,
//                             child: Column(
//                               children: [
//                                 Expanded(
//                                   flex: 3,
//                                   child: SizedBox(
//                                     width: Get.width,
//                                     child: CachedNetworkImage(
//                                         placeholder: (context, url) {
//                                           return Center(
//                                             child: CupertinoActivityIndicator(),
//                                           );
//                                         },
//                                         errorWidget: (context, url, error) {
//                                           return Center(
//                                               child: Icon(Icons.error));
//                                         },
//                                         imageUrl: cartModel
//                                             .productModel!.productsImage![0]),
//                                   ),
//                                 ),
//                                 Expanded(
//                                     flex: 1,
//                                     child: Text(
//                                       cartModel.totalPrice.toString(),
//                                       style: TextStyle(color: Colors.black),
//                                     )),
//                               ],
//                             ));
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:abu_s_application7/core/app_export.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../my_cart_screen/models/place_order_model.dart';

class OngoingOrder extends StatefulWidget {
  @override
  _OngoingOrderState createState() => _OngoingOrderState();
}

class _OngoingOrderState extends State<OngoingOrder> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placed Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('userPlaceOrders')
                  .where('userId',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
        
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No orders placed yet.'));
                }
        
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 130,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      PlaceOrderModel? orderModel;
                      try {
                        orderModel = PlaceOrderModel.fromJson(data);
                      } catch (error) {
                        print('Error parsing order model: $error');
                        orderModel = null;
                      }
        
                      // Handle null values and data structure issues
                      if (orderModel == null) {
                        return Center(
                            child: Text('Incomplete or invalid order data.'));
                      }
        
                      return Card(
                        surfaceTintColor: Colors.white,
                        elevation: 4,
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  width: Get.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                              child: CupertinoActivityIndicator(),
                                            ),
                                        errorWidget: (context, url, error) => Center(
                                              child: Icon(Icons.error),
                                            ),
                                        imageUrl: orderModel.cartModel.productModel!
                                            .productsImage![0]),
                                  ),
                                ),
                              ),
                              Text(
                                ' Quantity:  ${orderModel.cartModel.numberOfProducts.toString()}',
                                style: TextStyle(color: Colors.black),
                              ),
        
                              Text(
                                'Total:  ${orderModel.totalPrice.toString()}',
                                style: TextStyle(color: Colors.black),
                              ),
        
                              // Add more content based on your application's requirements
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
