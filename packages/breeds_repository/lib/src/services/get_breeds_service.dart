import 'dart:convert';

import 'package:breeds_repository/src/models/breed_model.dart';
import 'package:breeds_repository/src/models/breed_response_model.dart';
import 'package:breeds_repository/src/services/cat_service.dart';
import 'package:http/http.dart' as http;

class GetBreedsService extends CatService {
  GetBreedsService(String apiKey, String baseUrl)
      : super(apiKey, baseUrl);

  Future<BreedsResponse> fetchBreeds({int limit = 10, int page = 0}) async {
    final http.Response response = await get(
      '',
      queryParams: {'limit': '$limit', 'page': '$page'},
    );

    final List<dynamic> jsonData = json.decode(response.body) as List<dynamic>;
    final int totalCount = int.parse(
      (response.headers['pagination-count'] ?? '0'),
    );

    return BreedsResponse(
      breeds:
          jsonData.map((breedJson) => BreedModel.fromJson(breedJson)).toList(),
      totalCount: totalCount,
    );
  }
}
