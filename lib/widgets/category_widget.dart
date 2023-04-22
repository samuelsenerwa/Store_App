import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_app/consts/global_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      color: Colors.blue,
       child: Stack(
          children: [
              ClipRRect(
             borderRadius: BorderRadius.circular(12),
             child: FancyShimmerImage(
              height: size.height * 0.45,
              width: size.width * 0.45,
             errorWidget: const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 28,
              ),
              imageUrl:
                "https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg",
              boxFit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.center,
        child: Text("Category Name", 
        textAlign:TextAlign.center,
        style: TextStyle(backgroundColor:lightCardColor.withOpacity(0.5),
        ),
        ),
        ),
      ],
     ),
      ),
    );
  }
}
