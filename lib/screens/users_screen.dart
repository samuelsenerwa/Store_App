import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/services/api_handler.dart';
import 'package:shop_app/widgets/users_widget.dart';

import '../models/users_model.dart';
import '../widgets/category_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Users")),
        body: FutureBuilder<List<UsersModel>>(
            future: APIHandler.getAllUsers(),
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
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: snapshot.data![index],
                    child: const UsersWidget(),
                  );
                },
              );
            })));
  }
}
