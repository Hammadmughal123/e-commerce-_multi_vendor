import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/store_detail_page/store_detal_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/seller_pannel/seller_screens/add_new_seller/model/seller_detail_model.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('sellerData').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } 

        if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching data: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData) {
          return Text('No data found');
        }

        var docSnapshot = snapshot.data as QuerySnapshot;
        if (docSnapshot.docs.isEmpty) {
          return Center(child: Text('No documents found'));
        }

        List<SellerDetailModel> sellers = docSnapshot.docs
            .map((doc) =>
                SellerDetailModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: sellers.length,
          itemBuilder: (context, index) {
            SellerDetailModel seller = sellers[index];

            return GestureDetector(
              onTap: () {
                Get.to(StoreDetailScreen(
                  model: seller,
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: seller.sellerShopImages != null &&
                          seller.sellerShopImages!.isNotEmpty
                      ? Container(
                          height: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Center(
                                child: CupertinoActivityIndicator(),
                              ),
                              imageUrl: seller.sellerShopImages![0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Text('No seller images available'),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sellers[index].storeName.toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            sellers[index].storeAddress.toString(),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
