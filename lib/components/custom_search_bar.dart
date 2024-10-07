import 'package:cat_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onChanged;

  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      buildCupertino: (context) => CupertinoTextField(
        placeholder: 'Search',
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        suffix: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(CupertinoIcons.search, color: CupertinoColors.systemGrey),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey, width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
        onChanged: (value) {
          onChanged(value);
        },
      ),
      buildMaterial: (context) => TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Theme.of(context).hintColor),
          suffixIcon:
              Icon(Icons.search, color: Theme.of(context).iconTheme.color),
          border: _buildOutlineInputBorder(),
          focusedBorder: _buildOutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        ),
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color.fromARGB(255, 39, 2, 2), width: 1.0),
    );
  }
}
