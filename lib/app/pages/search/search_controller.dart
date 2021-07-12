import 'package:deneme/app/pages/search/search_presenter.dart';
import 'package:deneme/domain/entities/search.dart';
import 'package:deneme/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SearchController extends Controller {
  final SearchPresenter _presenter;
  SearchController(SearchRepository _searchRepository)
      : _presenter = SearchPresenter(_searchRepository);

  List<Search> search = [];

  @override
  void initListeners() {
    _presenter.addSearchHistoryOnComplete = () {};
    _presenter.addSearchHistoryOnError = (e) {
      print(e);
    };
  }

  void addSearchHistory(Search search) {
    _presenter.addSearchHistory(search);
  }
}
