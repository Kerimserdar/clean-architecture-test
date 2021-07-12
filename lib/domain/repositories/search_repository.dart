import 'package:deneme/domain/entities/search.dart';

abstract class SearchRepository {
  void addSearchHistory(Search search);
  Stream<List<Search>> getSearchHistory();
}
