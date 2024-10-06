import 'package:breeds_repository/src/models/breed_model.dart';
import 'package:breeds_repository/src/models/breed_response_model.dart';
import 'package:breeds_repository/src/services/breed_services.dart';

class CatBreedsRepository {
  final CatApiService apiService;

  CatBreedsRepository({required this.apiService});

  Future<BreedsResponse> getCatBreeds({int limit = 10, int page = 0}) {
    return apiService.fetchBreeds(limit: limit, page: page);
  }

  Future<List<BreedModel>> searchCatBreeds(
      {required String query, int limit = 10, int page = 0}) {
    return apiService.searchBreeds(query: query, limit: limit, page: page);
  }
}
