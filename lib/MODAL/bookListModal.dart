class Item {
  Item({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
  });

  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
      };
}

class VolumeInfo {
  VolumeInfo({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.printType,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  String title;
  String subtitle;
  List<String> authors;
  String publisher;
  DateTime publishedDate;
  String description;
  int pageCount;
  String printType;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"] ?? "",
        subtitle: json["subtitle"] ?? "",
        authors: List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"] ?? "",
        publishedDate: DateTime.parse(json["publishedDate"]),
        description: json["description"] ?? "",
        pageCount: json["pageCount"] ?? "",
        printType: json["printType"] ?? "",
        maturityRating: json["maturityRating"] ?? "",
        allowAnonLogging: json["allowAnonLogging"] ?? "",
        contentVersion: json["contentVersion"] ?? "",
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"] ?? "",
        previewLink: json["previewLink"] ?? "",
        infoLink: json["infoLink"] ?? "",
        canonicalVolumeLink: json["canonicalVolumeLink"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "publisher": publisher,
        "publishedDate":
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "description": description,
        "pageCount": pageCount,
        "printType": printType,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "imageLinks": imageLinks.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  String smallThumbnail;
  String thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}
