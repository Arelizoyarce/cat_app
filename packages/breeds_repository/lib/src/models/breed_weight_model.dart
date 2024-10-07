class Weight {
  final String? imperial;
  final String? metric;

  Weight({
    this.imperial,
    this.metric,
  });

  factory Weight.fromJson(Map<String, dynamic>? json) => Weight(
        imperial: json?["imperial"],
        metric: json?["metric"],
      );

  Map<String, dynamic>? toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}