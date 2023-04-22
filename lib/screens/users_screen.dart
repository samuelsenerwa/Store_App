import 'package:flutter/material.dart';
import 'package:shop_app/widgets/users_widget.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Users")),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const UsersWidget();
          },
        ));
  }
}
