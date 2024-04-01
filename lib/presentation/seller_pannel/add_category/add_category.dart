import 'package:abu_s_application7/core/app_export.dart';
import 'package:abu_s_application7/presentation/seller_pannel/add_category/controller/add_category_controller.dart';
import 'package:abu_s_application7/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_elevated_button.dart';

class AddCategoryScreen extends StatefulWidget {
  AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final AddCategoryController addCategoryController =
      Get.find<AddCategoryController>();

  int selectedRadioTile = 0;
  bool? selectedTerms = false;
  bool? selectedAddressLocation = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AddCategoryController>(builder: (ctrl) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 17,
                ),
              ),
              title: Text("lbl_add_product".tr),
            ),
            body: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: [
                          Text(
                            "lbl_add_images".tr,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            //width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border:
                                  Border.all(color: theme.colorScheme.primary),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 300,
                                    child: Obx(
                                      () => ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: ctrl.imageProductList.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                              // color: Colors.black,
                                              height: 120,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Container(
                                                    height: 120,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: theme
                                                                .colorScheme
                                                                .primary)),
                                                    child: Image.file(
                                                      ctrl.imageProductList[
                                                          index],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: -10,
                                                    top: -9,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        ctrl.imageProductList
                                                            .removeAt(index);
                                                      },
                                                      child: Container(
                                                        height: 25,
                                                        width: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                // Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(
                                    8,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      ctrl.imageDailogue(context);
                                    },
                                    child: Container(
                                      height: 120,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: theme.colorScheme.primary
                                              .withOpacity(0.3),
                                          border: Border.all(
                                              color:
                                                  theme.colorScheme.primary)),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 40,
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        "lbl_image_info".tr,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "lbl_add_category".tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownButtonHideUnderline(
                        child: Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor:
                              theme.colorScheme.primary.withOpacity(0.4)),
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.colorScheme.primary
                                          .withOpacity(0.4))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: theme.colorScheme.primary
                                          .withOpacity(0.4))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor:
                                  theme.colorScheme.primary.withOpacity(0.4),
                              filled: true),
                          value: ctrl.selectedCategory,
                          items:
                              ['Fast Food', 'Grocery', 'Electronics', 'Clothes']
                                  .map((e) => DropdownMenuItem(
                                        child: Text(
                                          e,
                                          style: TextStyle(),
                                        ),
                                        value: e,
                                      ))
                                  .toList(),
                          onChanged: (String? value) {
                            ctrl.selectedCategory = value!;
                          }),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text("lbl_add_name".tr,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: ctrl.addDetailController,
                      fillColor: theme.colorScheme.primary.withOpacity(0.4),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "lbl_product_name".tr,
                    ),
                    RadioListTile(
                      value: 0,
                      groupValue: selectedRadioTile,
                      onChanged: (int? value) {
                        setState(() {
                          selectedRadioTile = value ?? 0;
                        });
                      },
                      title: Text('In Stock'),
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile,
                      onChanged: (int? value) {
                        setState(() {
                          selectedRadioTile = value ?? 1;
                        });
                      },
                      title: Text('Out stock'),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: ctrl.priceController,
                            fillColor:
                                theme.colorScheme.primary.withOpacity(0.4),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "lbl_price".tr,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            controller: ctrl.salePriceController,
                            fillColor:
                                theme.colorScheme.primary.withOpacity(0.4),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "lbl_sale_price".tr,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              value: ctrl.selectedCurrencyType,
                              items: ctrl.currencyList.map((String product) {
                                return DropdownMenuItem<String>(
                                  value: product,
                                  child: Text(
                                    product,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                ctrl.selectedCurrencyType = value!;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: theme.colorScheme.primary)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: theme.colorScheme.primary)),
                                  labelText: 'Select Currency',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor: theme.colorScheme.primary
                                      .withOpacity(0.4),
                                  filled: true,
                                  labelStyle: TextStyle(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13, bottom: 13),
                      child: CustomTextFormField(
                        hintText: "lbl_description".tr,
                        controller: ctrl.desController,
                        maxLines: 5,
                        fillColor: theme.colorScheme.primary.withOpacity(0.4),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "lbl_add_location".tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        fillColor: MaterialStatePropertyAll(
                          Colors.white,
                        ),
                        title: Text("lbl_use_address".tr),
                        value: selectedAddressLocation,
                        onChanged: (value) {
                          setState(() {
                            selectedAddressLocation = value;
                          });
                        }),
                    CheckboxListTile(
                        fillColor: MaterialStatePropertyAll(
                          Colors.white,
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text("lbl_agree_with".tr),
                        value: selectedTerms,
                        onChanged: (value) {
                          setState(() {
                            selectedTerms = value;
                          });
                        }),
                    Row(
                      children: [
                        _buildSaveButton(
                            text: "lbl_cancel",
                            onPressed: () {
                              Get.back();
                            },
                            color: Colors.red),
                        SizedBox(
                          width: 10,
                        ),
                        _buildSaveButton(
                            text: "lbl_submit_product",
                            onPressed: () {
                              if (ctrl.addDetailController.text.isEmpty ||
                                  ctrl.desController.text.isEmpty ||
                                  ctrl.priceController.text.isEmpty ||
                                  ctrl.salePriceController.text.isEmpty) {
                                Get.snackbar(
                                    'Dordash', 'Please Fill All Instruction');
                              } else {
                                ctrl
                                    .saveDataInFirebase(
                                      selectedRadioTile,
                                    )
                                    .then((value) => {});
                              }
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ));
      }),
    );
  }

  Widget _buildSaveButton(
      {required String text, required Function()? onPressed, Color? color}) {
    return Expanded(
      child: CustomElevatedButton(
        buttonStyle:
            ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
        onPressed: onPressed ?? () {},
        text: text.tr.toUpperCase(),
        margin: EdgeInsets.only(
          // left: 24.h,
          // right: 24.h,
          bottom: 30.v,
        ),
        buttonTextStyle: theme.textTheme.titleMedium!,
      ),
    );
  }
}
