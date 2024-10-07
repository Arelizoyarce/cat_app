import 'package:breeds_repository/src/exceptions/exceptions.dart';
import 'package:breeds_repository/src/shared/network_verify.dart';
import 'package:http/http.dart' as http;

abstract class CatService {
  final String apiKey;
  final String baseUrl;

  CatService(this.apiKey, this.baseUrl);

  Future<dynamic> get(String endpoint,
      {Map<String, String>? queryParams}) async {
    if (!await networkVerify()) {
      throw NoInternetException(message: 'No Internet connection');
    }

    final uri =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);

    try {
      final response = await http.get(
        uri,
        headers: {'x-api-key': apiKey},
      );
      return _processResponse(response);
    } catch (e) {
      throw GeneralException(
          code: 500, message: 'An unexpected error occurred: $e');
    }
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ApiException(
          code: response.statusCode,
          message: 'Failed to load data: ${response.statusCode}');
    }
  }
}
