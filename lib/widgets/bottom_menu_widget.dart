import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramilemobiletest/models/bottom_menu_model.dart';
import 'package:xtramilemobiletest/screens/account/view.dart';
import 'package:xtramilemobiletest/screens/home_page/view.dart';
import 'package:xtramilemobiletest/screens/main_controller.dart';

import '../screens/list_discover_movies/view.dart';
import '../screens/wishlist/view.dart';
import '../utils/color.dart';
class BottomMenuWidget extends StatefulWidget {
  const BottomMenuWidget({Key? key}) : super(key: key);

  @override
  State<BottomMenuWidget> createState() => _BottomMenuWidgetState();
}

class _BottomMenuWidgetState extends State<BottomMenuWidget> {

  late MainController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<MainController>(context);
    return Container(
      color: AppColor.skate.shade300,
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BotttomMenuIcon(
              model: BottomMenuModel(
                  title: "Home",
                  image: Icons.home,
                  isSelected: controller.isSelected == 0,
                  onClick: () {
                    controller.isSelected = 0;
                    controller.screen = const HomePage();
                  })),
          BotttomMenuIcon(
              model: BottomMenuModel(
                  title: "Discover",
                  image: Icons.emoji_objects_outlined,
                  isSelected: controller.isSelected == 1,
                  onClick: () {
                    controller.isSelected = 1;
                    controller.screen = const DiscoverPage();
                  })),
          BotttomMenuIcon(
              model: BottomMenuModel(
                  title: "Favorite",
                  image: Icons.favorite,
                  isSelected: controller.isSelected == 2,
                  onClick: () {
                    controller.isSelected = 2;
                    controller.screen = const WishlistPage();
                  })),
          BotttomMenuIcon(
              model: BottomMenuModel(
                  title: "Account",
                  image: Icons.account_circle,
                  isSelected: controller.isSelected == 3,
                  onClick: () {
                    controller.isSelected = 3;
                    controller.screen = const AccountPage();
                  })),
        ],
      ),
    );
  }
}

class BotttomMenuIcon extends StatelessWidget {
  BottomMenuModel model;

  BotttomMenuIcon({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.onClick,
      child: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(
            model.image,
            size: 28,
            color: model.isSelected ? Colors.black : Colors.white70,
          )),
    );
  }
}
