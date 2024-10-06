import 'package:breeds_repository/breeds_repository.dart';
import 'package:cat_app/components/cat_card.dart';
import 'package:cat_app/home/bloc/home_bloc.dart';
import 'package:cat_app/home/bloc/home_event.dart';
import 'package:cat_app/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatCardList extends StatefulWidget {
  const CatCardList({super.key});

  @override
  _CatCardListState createState() => _CatCardListState();
}

class _CatCardListState extends State<CatCardList> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      _fetchMoreCats();
    }
  }

  void _fetchMoreCats() {
    final bloc = context.read<HomeBloc>();
    final state = bloc.state;
    if (state is HomeLoaded) {
      if (state.hasReachedMax == false) {
        bloc.add(FetchMoreCatsEvent(_currentPage));
        _currentPage++;
      }
    }
  }

  void _onCatTapped(BreedModel cat) {
    Navigator.pushNamed(
      context,
      '/cat_detail',
      arguments: cat,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded && state.cats.isNotEmpty) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.cats.length,
            itemBuilder: (context, index) {
              return CatCard(
                  cat: state.cats[index],
                  onTap: () => _onCatTapped(state.cats[index]));
            },
          );
        } else if (state is HomeError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('No data available.'));
      },
    );
  }
}
