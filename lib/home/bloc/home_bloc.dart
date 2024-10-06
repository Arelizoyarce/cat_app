import 'package:cat_app/home/bloc/home_event.dart';
import 'package:cat_app/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breeds_repository/breeds_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CatBreedsRepository _breedsRepository;
  HomeBloc(this._breedsRepository) : super(HomeInitial()) {
    on<SearchCatsEvent>(_onSearchCats);
    on<FetchMoreCatsEvent>(_onFetchMoreCats);
    on<ShowDetailCatEvent>(_onShowDetailRoute);
  }

  Future<void> _onSearchCats(
      SearchCatsEvent event, Emitter<HomeState> emit) async {}

  Future<void> _onFetchMoreCats(
      FetchMoreCatsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final catsResponse = await _breedsRepository.getCatBreeds(limit: 10, page: event.page);
      print('CATS HERE');
      print(catsResponse);
      emit(HomeLoaded(catsResponse));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onShowDetailRoute(
      ShowDetailCatEvent event, Emitter<HomeState> emit) async {}
}
