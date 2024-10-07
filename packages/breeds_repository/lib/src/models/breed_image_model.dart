class Image {
  final String? id;
  final int? width;
  final int? height;
  final String? url;

  Image({
    this.id,
    this.width,
    this.height,
    this.url,
  });


  factory Image.fromJson(Map<String, dynamic>? json) => Image(
        id: json?["id"],
        width: json?["width"],
        height: json?["height"],
        url: json?["url"],
      );

  Map<String, dynamic>? toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
      };
}
