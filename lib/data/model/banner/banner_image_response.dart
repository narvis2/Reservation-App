import 'package:reservation_app/data/common/utils/serializable.dart';

class BannerImageResponse implements Serializable {
  int id;
  String images;

  BannerImageResponse({
    required this.id,
    required this.images,
  });

  factory BannerImageResponse.fromJson(Map<String, dynamic> json) {
    return BannerImageResponse(
        id: (json["id"] ?? 0) as int,
        images: (json["images"] ?? '') as String
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {"id": id, "images": images};
  }
}
