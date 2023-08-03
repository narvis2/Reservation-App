import 'package:flutter/material.dart';
import 'package:reservation_app/data/utils/Endpoints.dart';
import 'package:reservation_app/domain/model/notice/image/notice_image_model.dart';

class GalleryItemThumbnail extends StatelessWidget {
  const GalleryItemThumbnail({
    Key? key,
    required this.galleryExampleItem,
  }) : super(key: key);

  final NoticeImageModel galleryExampleItem;

  @override
  Widget build(BuildContext context) {
    // debugPrint("galleryExampleItem 👉$galleryExampleItem");
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Hero(
        tag: galleryExampleItem.id,
        child: Image.network(
            Endpoints.baseImageUrl + galleryExampleItem.imageUrl,
            width: (size.width - 70),
            fit: BoxFit.fitWidth),
      ),
    );
  }
}
