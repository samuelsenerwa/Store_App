import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/services/api_handler.dart';

import '../widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: FutureBuilder<List<CategoriesModel>>(
            future: APIHandler.getAllCategories(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                Center(
                  child: Text("An Error occured ${snapshot.error}"),
                );
              } else if (snapshot.data == null) {
                const Center(
                  child: Text("No products Fetched"),
                );
              }
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                      value: snapshot.data![index],
                      child: const CategoryWidget(),
                    );
                  });
            })));
  }
}
