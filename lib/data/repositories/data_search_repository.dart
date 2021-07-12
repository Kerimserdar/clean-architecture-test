import 'dart:async';
import 'package:deneme/domain/entities/search.dart';
import 'package:deneme/domain/repositories/search_repository.dart';

class DataSearchRepository implements SearchRepository {
  static final _instance = DataSearchRepository._internal();
  DataSearchRepository._internal();
  factory DataSearchRepository() => _instance;

  StreamController<List<Search>> _streamController =
      StreamController.broadcast();
  List<Search> searches = [Search('1', 'Study Math', 'now')];

  @override
  void addSearchHistory(Search search) {
    try {
      searches.add(search);
      _streamController.add(searches);
    } catch (e) {
      print(e);
    }
  }

  @override
  Stream<List<Search>> getSearchHistory() {
    try {
      Future.delayed(Duration.zero).then(
        (_) => _streamController.add(searches),
      );
      return _streamController.stream;
    } catch (e) {
      rethrow;
    }
  }
}
