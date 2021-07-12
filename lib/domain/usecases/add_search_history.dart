import 'dart:async';
import 'package:deneme/domain/entities/search.dart';
import 'package:deneme/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddSearchHistory extends UseCase<void, AddSearchHistoryParams> {
  final SearchRepository _searchRepository;

  AddSearchHistory(this._searchRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(AddSearchHistoryParams? params) async {
    StreamController<void> controller = StreamController();

    try {
      _searchRepository.addSearchHistory(params!.search);
      logger.finest('AddSearchHistoryUseCase successful.');
      controller.close();
    } catch (error, st) {
      logger.severe('AddSearchHistoryUseCase unsuccessful.');
      controller.addError(error, st);
    }
    return controller.stream;
  }
}

class AddSearchHistoryParams {
  final Search search;

  AddSearchHistoryParams(this.search);
}
