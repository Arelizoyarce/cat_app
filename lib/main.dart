import 'package:breeds_repository/breeds_repository.dart';
import 'package:cat_app/home/bloc/home_bloc.dart';
import 'package:cat_app/routes/routes.dart';
import 'package:cat_app/splash/cubit/splash_cubit.dart';
import 'package:cat_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final breedsRepository = CatBreedsRepository();
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
        theme: AppTheme.getTheme(),
        initialRoute: '/',
        routes: getApplicationRoutes(),
      ),
    );
  }
}
