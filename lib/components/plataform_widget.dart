import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class PlatformWidget extends StatelessWidget {
  final Widget Function(BuildContext) buildCupertino;
  final Widget Function(BuildContext) buildMaterial;

  const PlatformWidget({
    super.key,
    required this.buildCupertino,
    required this.buildMaterial,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCupertino(context);
    }
    return buildMaterial(context);
  }
}
