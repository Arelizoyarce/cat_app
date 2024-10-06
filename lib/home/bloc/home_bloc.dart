import 'package:cat_app/home/bloc/home_event.dart';
import 'package:cat_app/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds_repository/breeds_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CatBreedsRepository _breedsRepository;
  List<BreedModel> _allCats = [];
  bool _hasFetchedInitialData = false;
  int _totalCount = 0;
  HomeBloc(this._breedsRepository) : super(HomeInitial()) {
    on<SearchCatsEvent>(_onSearchCats);
    on<FetchMoreCatsEvent>(_onFetchMoreCats);
    on<ShowDetailCatEvent>(_onShowDetailRoute);
  }

  Future<void> _onSearchCats(
      SearchCatsEvent event, Emitter<HomeState> emit) async {}

  Future<void> _onFetchMoreCats(
      FetchMoreCatsEvent event, Emitter<HomeState> emit) async {
    if (!_hasFetchedInitialData) {
      emit(HomeLoading());
    }
    try {
      final breedsResponse =
          await _breedsRepository.getCatBreeds(limit: 10, page: event.page);
      _allCats.addAll(breedsResponse.breeds);
      _totalCount = breedsResponse.totalCount;
      print('PAGE ${event.page}');
      print('TOTAL COUNT ${_totalCount}');
      print('TOTAL ${_allCats.length}');
      emit(HomeLoaded(_allCats, hasReachedMax: _allCats.length >= _totalCount));
      _hasFetchedInitialData = true;
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onShowDetailRoute(
      ShowDetailCatEvent event, Emitter<HomeState> emit) async {}
}
