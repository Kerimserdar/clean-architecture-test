import 'package:deneme/domain/entities/search.dart';
import 'package:deneme/domain/repositories/search_repository.dart';
import 'package:deneme/domain/usecases/add_search_history.dart';
import 'package:deneme/domain/usecases/get_search_history.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SearchPresenter extends Presenter {
  late Function addSearchHistoryOnComplete;
  late Function addSearchHistoryOnError;

  late Function getSearchHistoryOnNext;
  late Function getSearchHistoryOnError;

  final AddSearchHistory _addSearchHistory;
  final GetSearchHistory _getSearchHistory;

  SearchPresenter(SearchRepository _searchRepository)
      : _addSearchHistory = AddSearchHistory(_searchRepository),
      _getSearchHistory = GetSearchHistory(_searchRepository);

  void addSearchHistory(Search search) {
    _addSearchHistory.execute(
        _AddSearchHistoryObserver(this), AddSearchHistoryParams(search));
  }

  void getSearchHistory() {
    _getSearchHistory.execute(_GetSearchHistoryObserver(this));
  }

  @override
  void dispose() {
    _addSearchHistory.dispose();
    _getSearchHistory.dispose();
  }
}

class _AddSearchHistoryObserver extends Observer<void> {
  final SearchPresenter _presenter;

  _AddSearchHistoryObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.addSearchHistoryOnComplete();
  }

  @override
  void onError(e) {
    _presenter.addSearchHistoryOnError(e);
  }

  @override
  void onNext(_) {}
}

class _GetSearchHistoryObserver extends Observer<List<Search>> {
  final SearchPresenter _presenter;

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
