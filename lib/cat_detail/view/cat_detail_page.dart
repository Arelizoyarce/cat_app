import 'package:breeds_repository/breeds_repository.dart';
import 'package:flutter/material.dart';

class CatDetailPage extends StatelessWidget {
  final BreedModel item;

  const CatDetailPage({super.key, required this.item});

  static const String _unknown = 'Not available.';

  Widget _buildText(String? text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text ?? _unknown,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Widget> _buildAttributes(BreedModel item) {
    final attributes = [
      {'label': 'Country of origin:', 'value': item.origin},
      {'label': 'Intelligence:', 'value': item.intelligence?.toString()},
      {'label': 'Adaptability:', 'value': item.adaptability?.toString()},
      {'label': 'Life span:', 'value': item.lifeSpan},
      {'label': 'Weight:', 'value': item.weight.imperial},
      {'label': 'Temperament:', 'value': item.temperament},
    ];

    return attributes.map((attr) {
      return _buildText('${attr['label']} ${attr['value']}');
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name ?? _unknown),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: deviceWidth * 0.9,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.image.url ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(item.description),
                      ..._buildAttributes(item),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
