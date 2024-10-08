abstract class HomeEvent {}

class SearchCatsEvent extends HomeEvent {
  final String breed;

  SearchCatsEvent(this.breed);
}

class FetchMoreCatsEvent extends HomeEvent {
  final int page;

  FetchMoreCatsEvent(this.page);
}
