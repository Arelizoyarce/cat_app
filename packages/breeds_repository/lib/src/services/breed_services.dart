import 'dart:convert';
import 'package:breeds_repository/src/models/breed_model.dart';
import 'package:breeds_repository/src/models/breed_response_model.dart';
import 'package:http/http.dart' as http;

class CatApiService {
  final String apiKey;
  final String baseUrl = 'https://api.thecatapi.com/v1/breeds';

  CatApiService({required this.apiKey});

  Future<BreedsResponse> fetchBreeds({int limit = 10, int page = 0}) async {
    final response = await http.get(
      Uri.parse('$baseUrl?limit=$limit&page=$page'),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final int totalCount =
          int.parse(response.headers['pagination-count'] ?? '0');

      return BreedsResponse(
        breeds: jsonData
            .map((breedJson) => BreedModel.fromJson(breedJson))
            .toList(),
        totalCount: totalCount,
      );
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  Future<List<BreedModel>> searchBreeds(
      {required String query, int limit = 10, int page = 0}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search?q=$query'),
      headers: {'x-api-key': apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((breedJson) => BreedModel.fromJson(breedJson))
          .toList();
    } else {
      throw Exception('Failed to search breeds');
    }
  }
}
