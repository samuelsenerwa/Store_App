import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/products_model.dart';
import 'package:shop_app/services/api_handler.dart';
import 'package:shop_app/widgets/feeds_widget.dart';

import '../widgets/feeds_grid.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<ProductsModel> productsList = [];
  @override
  void didChangeDependacies() {
    getProducts();
    super.didChangeDependencies();
  }

  Future<void> getProducts() async {
    productsList = await APIHandler.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
              // elevation: 4,
              title: const Text('All Products'),
              
            ),
            body: productsList.isEmpty
            ? const Center(
              child: CircularProgressIndicator(),
            ):
            GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),//makes the app scrollable
              itemCount: productsList.length,
              gridDelegate:
             const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 0.6),
              itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                      value: productsList[index],
                      child: const FeedsWidget(),
                    );
      }));
  }
}