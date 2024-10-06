import 'package:breeds_repository/breeds_repository.dart';
import 'package:cat_app/home/bloc/home_bloc.dart';
import 'package:cat_app/routes/routes.dart';
import 'package:cat_app/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final breedsRepository =
        CatBreedsRepository(apiService: CatApiService(apiKey: 'live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr'));
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (BuildContext context) => SplashCubit(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(breedsRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cat Breeds App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: getApplicationRoutes(),
      ),
    );
  }
}
