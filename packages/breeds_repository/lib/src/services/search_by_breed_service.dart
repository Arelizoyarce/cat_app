import 'dart:convert';

import 'package:breeds_repository/src/services/cat_service.dart';
import 'package:breeds_repository/src/models/breed_model.dart';
import 'package:http/http.dart' as http;

class SearchBreedsService extends CatService {
  SearchBreedsService(String apiKey, String baseUrl)
      : super(apiKey, baseUrl);

  Future<List<BreedModel>> searchBreeds(
      {required String query, int limit = 10, int page = 0}) async {
    final http.Response response = await get(
      '/search',
      queryParams: {'q': query},
    );

    final List<dynamic> jsonData = json.decode(response.body) as List<dynamic>;
    return jsonData.map((breedJson) => BreedModel.fromJson(breedJson)).toList();
  }
}
