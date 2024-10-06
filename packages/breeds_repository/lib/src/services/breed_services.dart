import 'dart:convert';
import 'package:breeds_repository/src/models/breed_model.dart';
import 'package:breeds_repository/src/models/breed_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CatApiService {
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  CatApiService();

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
