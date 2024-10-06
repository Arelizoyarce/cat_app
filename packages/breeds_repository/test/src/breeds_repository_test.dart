// ignore_for_file: prefer_const_constructors
import 'package:breeds_repository/breeds_repository.dart';
import 'package:test/test.dart';

void main() {
  group('BreedsRepository', () {
    test('can be instantiated', () {
      expect(BreedsRepository(), isNotNull);
    });
  });
}
