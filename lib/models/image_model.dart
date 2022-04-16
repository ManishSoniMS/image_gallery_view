class ImageModel {
  final String url;
  final double width;
  final double height;

  const ImageModel({
    required this.url,
    this.width = 800,
    this.height = 1200,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageModel &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          width == other.width &&
          height == other.height);

  @override
  int get hashCode => url.hashCode ^ width.hashCode ^ height.hashCode;

  @override
  String toString() {
    return 'ImageModel{'
        ' url: $url,'
        ' width: $width,'
        ' height: $height,'
        '}';
  }

  ImageModel copyWith({
    String? url,
    double? width,
    double? height,
  }) {
    return ImageModel(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      url: map['url'] as String,
      width: map['width'] ?? 800,
      height: map['height'] ?? 1200,
    );
  }
}
