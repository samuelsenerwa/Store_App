import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_app/consts/global_colors.dart';
import 'package:shop_app/widgets/appbar_icons.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:shop_app/widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // elevation: 4,
          title: const Text('Home'),
          leading: AppBarIcons(
            function: () {},
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(function: () {}, icon: IconlyBold.user3),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: lightIconColor,
                    )),
              ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: size.height * 0.25,
                          //continue from here
                          child: Swiper(
                              itemCount: 3,
                              itemBuilder: (ctx, index) {
                                return const SaleWidget();
                              },
                              pagination: const SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                builder: DotSwiperPaginationBuilder(
                                  color: Colors.white, activeColor: Colors.red
                                )
                                ),   
                              ),
                              )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
