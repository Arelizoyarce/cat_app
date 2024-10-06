import 'package:breeds_repository/breeds_repository.dart';

class BreedsResponse {
  final List<BreedModel> breeds;
  final int totalCount;

  BreedsResponse({required this.breeds, required this.totalCount});
}
