import 'package:deneme/app/pages/search/search_controller.dart';
import 'package:deneme/data/repositories/data_search_repository.dart';
import 'package:deneme/domain/entities/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SearchView extends View {
  @override
  State<StatefulWidget> createState() => _SearchViewState(
        SearchController(DataSearchRepository()),
      );
}

class _SearchViewState extends ViewState<SearchView, SearchController> {
  _SearchViewState(SearchController controller) : super(controller);

  TextEditingController _textController = TextEditingController();

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
              ControlledWidgetBuilder<SearchController>(
                  builder: (context, controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 250,
                          child: TextFormField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.addSearchHistory(
                                Search("", _textController.text, ""));
                          },
                          icon: Icon(Icons.search),
                        )
                      ],
                    ),
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
