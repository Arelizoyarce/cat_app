import 'package:cat_app/home/view/home_page.dart';
import 'package:cat_app/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    context.read<SplashCubit>().startSplashTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, bool>(
      builder: (context, state) {
        if (state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          });
        }
        return Scaffold(
          body: FadeTransition(
            opacity: _opacityAnimation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Catbreets',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/cat_icon.png',
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
