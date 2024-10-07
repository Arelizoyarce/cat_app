import 'package:cat_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformWidget(
              buildCupertino: (context) => const Icon(
                CupertinoIcons.clear_thick_circled,
                size: 100,
                color: Colors.grey,
              ),
              buildMaterial: (context) => const Icon(
                Icons.error_outline,
                size: 100,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'No data available.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
