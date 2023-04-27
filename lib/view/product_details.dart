import 'package:flutter/material.dart';
import 'package:mvc_api/controller/products_controller.dart';
import 'package:mvc_api/model/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Products>? products;
  late ProductsController controller;
  late bool isLoading;

  getData() async {
    isLoading = true;
    await controller.getProducts().then((value) {
      setState(() {
        isLoading = false;
        products = value.products;
      });
    });
  }

  @override
  void initState() {
    isLoading = false;
    products = [];
    super.initState();
    controller = ProductsController();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: products!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(products![index].title!);
              }),
    );
  }
}
