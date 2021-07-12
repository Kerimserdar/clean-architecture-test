import 'package:deneme/domain/entities/search.dart';
import 'package:deneme/domain/repositories/search_repository.dart';
import 'package:deneme/domain/usecases/add_search_history.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SearchPresenter extends Presenter {
  late Function addSearchHistoryOnComplete;
  late Function addSearchHistoryOnError;

  final AddSearchHistory _addSearchHistory;

  SearchPresenter(SearchRepository _searchRepository)
      : _addSearchHistory = AddSearchHistory(_searchRepository);

  void addSearchHistory(Search search) {
    _addSearchHistory.execute(
        _AddSearchHistoryObserver(this), AddSearchHistoryParams(search));
  }

  @override
  void dispose() {
    _addSearchHistory.dispose();
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
