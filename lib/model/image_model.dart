class ImageModel {
  final int page;
  final int perPage;
  final List<Photo> photos;
  final int totalResults;
  final String nextPage;

  ImageModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        page: json['page'],
        perPage: json['per_page'],
        photos: List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x))),
        totalResults: json['total_results'],
        nextPage: json['next_page'],
      );
}

class Photo {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final PhotoSrc src;
  final bool liked;
  final String alt;

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

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json['id'],
        width: json['width'],
        height: json['height'],
        url: json['url'],
        photographer: json['photographer'],
        photographerUrl: json['photographer_url'],
        photographerId: json['photographer_id'],
        avgColor: json['avg_color'],
        src: PhotoSrc.fromJson(json['src']),
        liked: json['liked'],
        alt: json['alt'],
      );
}

class PhotoSrc {
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  PhotoSrc({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory PhotoSrc.fromJson(Map<String, dynamic> json) => PhotoSrc(
        original: json['original'],
        large2x: json['large2x'],
        large: json['large'],
        medium: json['medium'],
        small: json['small'],
        portrait: json['portrait'],
        landscape: json['landscape'],
        tiny: json['tiny'],
      );
}
