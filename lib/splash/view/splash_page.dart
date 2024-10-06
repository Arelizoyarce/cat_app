import 'package:cat_app/home/view/home_page.dart';
import 'package:cat_app/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().startSplashTimer();
    double deviceWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SplashCubit, bool>(
      builder: (context, state) {
        if (state) {
          Future.microtask(() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const HomePage()),
              ));
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Cadbreets',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/cat_icon.png',
                  width: deviceWidth / 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
