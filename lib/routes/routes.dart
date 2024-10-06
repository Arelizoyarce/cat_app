import 'package:breeds_repository/breeds_repository.dart';
import 'package:cat_app/cat_detail/view/cat_detail_page.dart';
import 'package:cat_app/home/view/home_page.dart';
import 'package:cat_app/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const SplashPage(),
    '/home': (BuildContext context) => const HomePage(),
    '/cat_detail': (context) {
      final BreedModel item =
          ModalRoute.of(context)!.settings.arguments as BreedModel;
      return CatDetailPage(item: item);
    },
  };
}
