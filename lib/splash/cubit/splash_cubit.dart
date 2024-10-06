import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  void startSplashTimer() {
    Timer(const Duration(seconds: 3), () {
      emit(true);
    });
  }
}
