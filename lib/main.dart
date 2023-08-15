import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtramilemobiletest/screens/main_app_page.dart';
import 'package:xtramilemobiletest/screens/main_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MainController(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const MainAppPage()));
  }
}
