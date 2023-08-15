import 'package:flutter/material.dart';
import 'package:xtramilemobiletest/screens/main_controller.dart';
import 'package:provider/provider.dart';
import 'package:xtramilemobiletest/widgets/bottom_menu_widget.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({Key? key}) : super(key: key);

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  late MainController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<MainController>(context);
    return Scaffold(
      bottomNavigationBar: BottomMenuWidget(),
      body: SafeArea(
        child: controller.screen,
      ),
    );
  }
}
