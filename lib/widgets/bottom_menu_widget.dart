import 'package:flutter/material.dart';
import 'package:xtramilemobiletest/models/bottom_menu_model.dart';

class BottomMenuWidget extends StatelessWidget {
  const BottomMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BotttomMenuIcon(
              model: BottomMenuModel(
                  title: "Home", image: Icons.home, onClick: () {})),
          BotttomMenuIcon(
              model: BottomMenuModel(
                  title: "Discover", image: Icons.emoji_objects_outlined, onClick: () {})),
          BotttomMenuIcon(
              model: BottomMenuModel(
                  title: "Favorite", image: Icons.favorite, onClick: () {})),
          BotttomMenuIcon(
              model: BottomMenuModel(
                  title: "Account", image: Icons.account_circle, onClick: () {})),
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
    return Container(
        padding: const EdgeInsets.all(8), child: Icon(model.image, size: 24));
  }
}
