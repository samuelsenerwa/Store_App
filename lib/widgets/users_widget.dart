import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/consts/global_colors.dart';

import '../models/users_model.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UsersModel usersModelProvider = Provider.of<UsersModel>(context);
    return ListTile(
      leading: FancyShimmerImage(
        height: size.height * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl:
            usersModelProvider.avatar.toString(),
        boxFit: BoxFit.fill,
      ),
      title:  Text(usersModelProvider.name.toString()),
      subtitle:  Text(usersModelProvider.email.toString()),
      trailing: Text(
        "User role",
        style: TextStyle(
          color: lightIconColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
