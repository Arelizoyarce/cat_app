import 'package:cat_app/components/components.dart';
import 'package:cat_app/home/bloc/home_bloc.dart';
import 'package:cat_app/home/bloc/home_event.dart';
import 'package:cat_app/home/view/card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(FetchMoreCatsEvent(0));
  }

  @override
  void dispose() {
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
            SizedBox(height: 20,),
            Expanded(
              child: CatCardList(),
            ),
          ],
        ),
      ),
    );
  }
}

