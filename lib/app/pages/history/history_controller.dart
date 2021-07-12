import 'package:deneme/domain/entities/search.dart';
import 'package:deneme/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'history_presenter.dart';

class HistoryController extends Controller {
  final HistoryPresenter _presenter;
  HistoryController(SearchRepository _searchRepository)
      : _presenter = HistoryPresenter(_searchRepository);

  List<Search> search = [];

  @override
  void initListeners() {
    _presenter.getSearchHistoryOnNext = (List<Search> response) {
      search = response;
      refreshUI();
    };
    _presenter.getSearchHistoryOnError = (e) {
      print(e);
    };
  }

  @override
  void onInitState() {
    _presenter.getSearchHistory();

    super.onInitState();
  }
}
