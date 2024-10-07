import 'package:breeds_repository/src/models/models.dart';
import 'package:breeds_repository/src/services/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CatBreedsRepository {
  final GetBreedsService getBreedsService;
  final SearchBreedsService searchBreedsService;

  CatBreedsRepository()
      : getBreedsService = GetBreedsService(
          _getApiKey(),
          _getBaseUrl(),
        ),
        searchBreedsService = SearchBreedsService(
          _getApiKey(),
          _getBaseUrl(),
        );

  static String _getApiKey() => dotenv.env['API_KEY'] ?? '';

  static String _getBaseUrl() => dotenv.env['BASE_URL'] ?? '';

  Future<BreedsResponse> getCatBreeds({int limit = 10, int page = 0}) {
    return getBreedsService.fetchBreeds(limit: limit, page: page);
  }

  Future<List<BreedModel>> searchCatBreeds({required String query}) {
    return searchBreedsService.searchBreeds(query: query);
  }
}
