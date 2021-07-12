import 'package:deneme/app/pages/history/history_controller.dart';
import 'package:deneme/data/repositories/data_search_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HistoryView extends View {
  @override
  State<StatefulWidget> createState() => _HistoryViewState(
        HistoryController(DataSearchRepository()),
      );
}

class _HistoryViewState extends ViewState<HistoryView, HistoryController> {
  _HistoryViewState(HistoryController controller) : super(controller);

  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ControlledWidgetBuilder<HistoryController>(
                  builder: (context, controller) {
                return Column(
                  children: [
                    for (int i = 0; i < controller.search.length; i++)
                      Container(
                        child: Text(
                          controller.search[i].text,
                        ),
                      )
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
