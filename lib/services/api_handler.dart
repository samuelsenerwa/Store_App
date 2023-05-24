import 'dart:convert';
import 'package:shop_app/consts/api_consts.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/products_model.dart';
import 'package:shop_app/models/users_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({required String target}) async {
    var uri = Uri.https(
      BASE_URL,
      "api/v1/products",
    );
    var response = await http.get(uri);

    // print("response ${jsonDecode(response.body)}");

    var data = jsonDecode(response.body);
    List tempList = [];
    for (var v in data) {
      tempList.add(v);
      // print("V $v \n\n");
    }
    return tempList;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List temp = await getData(target: "products");
    return ProductsModel.productsFromSnapshot(temp);
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoriesModel.categoriesFromSnapshot(temp);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(target: "users");
    return UsersModel.UsersFromSnapshot(temp);
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    var uri = Uri.https(
      BASE_URL,
      "api/v1/products/$id",
    );
    var response = await http.get(uri);

    // print("response ${jsonDecode(response.body)}");

    var data = jsonDecode(response.body);

    return ProductsModel.fromJson(data);
  }
}
