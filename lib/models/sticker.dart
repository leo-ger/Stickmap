import 'package:maplibre_gl/mapbox_gl.dart';

class Sticker {
  final int id;
  final int stickerTypeId;
  final LatLng location;
  final List<String> imageUrls;
  final String title;
  final String description;
  final DateTime created;
  final List<DateTime> modified;

  Sticker(
      {required this.id,
      required this.stickerTypeId,
      required this.location,
      required this.imageUrls,
      required this.title,
      required this.description,
      required this.created,
      required this.modified});

  factory Sticker.fromJson(Map<dynamic, dynamic> json) {
    return Sticker(
        id: json['id'],
        stickerTypeId: json['stickerTypeId'],
        location: json['location'],
        imageUrls: json['imageUrls'],
        title: json['title'],
        description: json['description'],
        created: json['created'],
        modified: json['modified']);
  }
}

class StickerType {
  final int stickerTypeId;
  final String name;
  final String description;
  final String imageUrl;

  StickerType(
      {required this.stickerTypeId,
      required this.name,
      required this.description,
      required this.imageUrl});

  factory StickerType.fromJson(Map<dynamic, dynamic> json) {
    return StickerType(
        stickerTypeId: json['stickerTypeId'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl']);
  }
}
