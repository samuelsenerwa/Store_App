import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/products_model.dart';
import 'package:shop_app/widgets/feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
 const FeedsGridWidget({Key? key, required this.productsList}) : super(key: key);

  final List<ProductsModel> productsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.7),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
           value: productsList[0],
           child: const FeedsWidget(),
          );
        });
  }
}
