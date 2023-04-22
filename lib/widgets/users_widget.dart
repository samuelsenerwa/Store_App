import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_app/consts/global_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            "https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg",
        boxFit: BoxFit.fill,
      ),
      title: const Text("Username"),
      subtitle: const Text("Email@email.com"),
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
