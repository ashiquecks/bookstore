class BookDetailsModal {
  BookDetailsModal({
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

  factory BookDetailsModal.fromJson(Map<String, dynamic> json) =>
      BookDetailsModal(
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
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printedPageCount,
    required this.dimensions,
    required this.printType,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
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
  List<IndustryIdentifier> industryIdentifiers;
  ReadingModes readingModes;
  int pageCount;
  int printedPageCount;
  Dimensions dimensions;
  String printType;
  List<String> categories;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
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
        industryIdentifiers: List<IndustryIdentifier>.from(
            json["industryIdentifiers"]
                .map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"] ?? "",
        printedPageCount: json["printedPageCount"] ?? "",
        dimensions: Dimensions.fromJson(json["dimensions"]),
        printType: json["printType"] ?? "",
        categories: List<String>.from(json["categories"].map((x) => x)),
        maturityRating: json["maturityRating"] ?? "",
        allowAnonLogging: json["allowAnonLogging"] ?? "",
        contentVersion: json["contentVersion"] ?? "",
        panelizationSummary:
            PanelizationSummary.fromJson(json["panelizationSummary"]),
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
        "industryIdentifiers":
            List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
        "readingModes": readingModes.toJson(),
        "pageCount": pageCount,
        "printedPageCount": printedPageCount,
        "dimensions": dimensions.toJson(),
        "printType": printType,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary.toJson(),
        "imageLinks": imageLinks.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class Dimensions {
  Dimensions({
    required this.height,
  });

  String height;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
      };
}

class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
  });

  String smallThumbnail;
  String thumbnail;
  String small;
  String medium;
  String large;
  String extraLarge;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
        extraLarge: json["extraLarge"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
        "small": small,
        "medium": medium,
        "large": large,
        "extraLarge": extraLarge,
      };
}

class IndustryIdentifier {
  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  String type;
  String identifier;

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
      };
}

class PanelizationSummary {
  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  bool containsEpubBubbles;
  bool containsImageBubbles;

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

class ReadingModes {
  ReadingModes({
    required this.text,
    required this.image,
  });

  bool text;
  bool image;

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}
