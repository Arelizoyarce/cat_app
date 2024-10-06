import 'package:cat_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      buildCupertino: (context) => CupertinoTextField(
        placeholder: 'Buscar',
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        suffix: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(CupertinoIcons.search, color: CupertinoColors.systemGrey),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey, width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      buildMaterial: (context) => TextField(
        decoration: InputDecoration(
          hintText: 'Buscar',
          hintStyle: TextStyle(color: Theme.of(context).hintColor),
          suffixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
          border: _buildOutlineInputBorder(),
          focusedBorder: _buildOutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
    );
  }
}
