import 'dart:async';
import 'package:deneme/domain/entities/search.dart';
import 'package:deneme/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetSearchHistory extends UseCase<List<Search>, void> {
  final SearchRepository _searchRepository;

  GetSearchHistory(this._searchRepository);
  final StreamController<List<Search>> _controller =
      StreamController.broadcast();

  @override
  Future<Stream<List<Search>?>> buildUseCaseStream(void params) async {
    try {
      _searchRepository.getSearchHistory().listen((List<Search> search) {
        _controller.add(search);
      });
      logger.finest('GetSearchHistoryUseCase successful.');
    } catch (e) {
      logger.severe('GetSearchHistoryUseCase unsuccessful.');

      _controller.addError(e);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
