

import 'package:cat_app/home/view/home_page.dart';
import 'package:cat_app/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const SplashPage(),
    '/home': (BuildContext context) => const HomePage(),
    // '/cat_detail': (BuildContext context) => const SignupPage(),
  };
}