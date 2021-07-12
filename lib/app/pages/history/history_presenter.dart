import 'package:deneme/domain/entities/search.dart';
import 'package:deneme/domain/repositories/search_repository.dart';
import 'package:deneme/domain/usecases/get_search_history.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HistoryPresenter extends Presenter {
  late Function getSearchHistoryOnNext;
  late Function getSearchHistoryOnError;

  final GetSearchHistory _getSearchHistory;

  HistoryPresenter(SearchRepository _searchRepository)
      : _getSearchHistory = GetSearchHistory(_searchRepository);

  void getSearchHistory() {
    _getSearchHistory.execute(_GetSearchHistoryObserver(this));
  }

  @override
  void dispose() {
    _getSearchHistory.dispose();
  }
}

class _GetSearchHistoryObserver extends Observer<List<Search>> {
  final HistoryPresenter _presenter;

  _GetSearchHistoryObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(error) {
    _presenter.getSearchHistoryOnError(error);
  }

  @override
  void onNext(List<Search>? response) {
    _presenter.getSearchHistoryOnNext(response);
  }
}