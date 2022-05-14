class ImageEntity {
  ImageEntity({
    required this.page,
    required this.perPage,
    required this.photos,
    // required this.totalResults,
    // required this.nextPage,
    // required this.prevPage,
  });

  final int page;
  final int perPage;
  final List<Photo> photos;
  // final int totalResults;
  // final String nextPage;
  // final String prevPage;

  factory ImageEntity.fromMap(Map<String, dynamic> map) => ImageEntity(
        page: map["page"],
        perPage: map["per_page"],
        photos: List<Photo>.from(map["photos"].map((x) => Photo.fromMap(x))),
        // totalResults: map["total_results"],
        // nextPage: map["next_page"],
        // prevPage: map["prev_page"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "per_page": perPage,
        "photos": List<dynamic>.from(photos.map((x) => x.toMap())),
        // "total_results": totalResults,
        // "next_page": nextPage,
        // "prev_page": prevPage,
      };
}

class Photo {
  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final Src src;
  final bool liked;
  final String alt;

  factory Photo.fromMap(Map<String, dynamic> map) => Photo(
        id: map["id"],
        width: map["width"],
        height: map["height"],
        url: map["url"],
        photographer: map["photographer"],
        photographerUrl: map["photographer_url"],
        photographerId: map["photographer_id"],
        avgColor: map["avg_color"],
        src: Src.fromMap(map["src"]),
        liked: map["liked"],
        alt: map["alt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src.toMap(),
        "liked": liked,
        "alt": alt,
      };
}

class Src {
  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  final String original;
  final String large2X;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  factory Src.fromMap(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
      );

  Map<String, dynamic> toMap() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
      };
}
