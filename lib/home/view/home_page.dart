import 'package:cat_app/components/components.dart';
import 'package:cat_app/home/bloc/home_bloc.dart';
import 'package:cat_app/home/bloc/home_event.dart';
import 'package:cat_app/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<HomeBloc>().add(FetchMoreCatsEvent(currentPage));
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      currentPage++;
      context.read<HomeBloc>().add(FetchMoreCatsEvent(currentPage));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          children: [
            CustomSearchBar(),
            Expanded(
              child: CatCardList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CatCardList extends StatelessWidget {
  const CatCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          final cats = state.cats;
          return ListView.builder(
            itemCount: cats.length,
            itemBuilder: (context, index) {
              return CatCard(cat: cats[index],); // Asegúrate de pasar el modelo adecuado
            },
          );
        } else if (state is HomeError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const Center(child: Text('No hay datos disponibles.'));
      },
    );
  }
}
