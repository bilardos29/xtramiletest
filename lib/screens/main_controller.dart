import 'package:flutter/cupertino.dart';
import 'package:xtramilemobiletest/screens/home_page/view.dart';

class MainController extends ChangeNotifier {
  int _isSelected = 0;
  late Widget _screen = const HomePage();

  set isSelected(int val){
    _isSelected = val;
    notifyListeners();
  }

  int get isSelected => _isSelected;

  set screen(Widget val){
    _screen = val;
    notifyListeners();
  }

  Widget get screen => _screen;
}