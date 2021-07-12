import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'home_controller.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() => _HomeViewState(HomeController());
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);

  @override
  Widget get view {
    return ControlledWidgetBuilder<HomeController>(
        builder: (context, controller) {
      return Scaffold(
        key: globalKey,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: controller.onPageChanged,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color:
                    controller.selectedIndex == 0 ? Colors.green : Colors.grey,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    color: controller.selectedIndex == 0
                        ? Colors.green
                        : Colors.grey),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color:
                    controller.selectedIndex == 1 ? Colors.green : Colors.grey,
              ),
              title: Text(
                'Search',
                style: TextStyle(
                    color: controller.selectedIndex == 1
                        ? Colors.green
                        : Colors.grey),
              ),
            ),
          ],
        ),
        body: controller.screens[controller.selectedIndex],
      );
    });
  }
}
