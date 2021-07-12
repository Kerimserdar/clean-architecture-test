import 'package:deneme/app/pages/history/history_view.dart';
import 'package:deneme/app/pages/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final PageController pageController = PageController();
  final List<Widget> screens = [
    HistoryView(),
    SearchView(),
  ];
  int selectedIndex = 0;

  void onPageChanged(int index) {
    selectedIndex = index;
    refreshUI();
  }

  @override
  void initListeners() {}
}