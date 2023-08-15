import 'package:flutter/cupertino.dart';

class BottomMenuModel {
  final String title;
  final IconData image;
  final bool isSelected;
  final VoidCallback onClick;

  BottomMenuModel(
      {required this.title,
      required this.image,
      this.isSelected = false,
      required this.onClick});
}
