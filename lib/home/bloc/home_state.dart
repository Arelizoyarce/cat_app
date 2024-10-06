import 'package:breeds_repository/breeds_repository.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BreedModel> cats;
  final bool hasReachedMax;

  HomeLoaded(this.cats, {this.hasReachedMax = false});
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class HomeShowDetail extends HomeState {
  final String id;

  HomeShowDetail(this.id);
}
