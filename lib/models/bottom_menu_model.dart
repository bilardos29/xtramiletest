import 'package:flutter/cupertino.dart';

class BottomMenuModel {
  final String title;
  final IconData image;
  final VoidCallback onClick;

  BottomMenuModel({required this.title, required this.image, required this.onClick});

}
