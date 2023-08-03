import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:reservation_app/data/utils/Endpoints.dart';
import 'package:reservation_app/domain/model/notice/image/notice_image_model.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';

@RoutePage()
class NoticeDetailScreen extends StatefulWidget {
  const NoticeDetailScreen({required this.notice});

  final NoticeModel notice;
  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    buildTitle() {
      List<String> splitCreateDateTime = widget.notice.createdAt.split("T");
      String parseCreateDate =
          splitCreateDateTime[0].replaceAll("-", "/").substring(2);
      String titleText = widget.notice.title;
      debugPrint('parseCreateDate 👉 $parseCreateDate');
      debugPrint(splitCreateDateTime[1]);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            parseCreateDate,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: ColorsConstants.guideText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              titleText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: ColorsConstants.boldColor,
              ),
            ),
          ),
        ],
      );
    }

    buildImageList() {
      if (widget.notice.images.isEmpty) {
        return Container();
      } else {
        List<String> images = widget.notice.images
            .map((e) => (Endpoints.baseImageUrl + e.imageUrl))
            .toList();

        return CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
              enableInfiniteScroll: false,
            ),
            items: images
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      elevation: 6.0,
                      shadowColor: ColorsConstants.divider,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            open(context, currentIndex);
                          },
                          child: Hero(
                            tag: item,
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList());

        // return ListView.builder(
        //   physics: BouncingScrollPhysics(),
        //   itemCount: sampleImages.length,
        //   scrollDirection: Axis.horizontal,
        //   controller: _scrollController,
        //   dragStartBehavior: DragStartBehavior.start,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        //       child: GestureDetector(
        //         onTap: () {
        //           debugPrint('index 👉 $index');
        //           open(context, index);
        //         },
        //         child: Hero(
        //           tag: sampleImages[index],
        //           child: Image.network(sampleImages[index],
        //               width: (size.width - 20), fit: BoxFit.fitWidth),
        //         ),
        //       ),
        //     );
        //   },
        // );
      }
    }

    buildContent() {
      return Text(
        // widget.notice.content,
        Constants.noticeContentSample,
        style: TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
      );
    }

    // debugPrint("notice => ${widget.notice}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '공지사항',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: ColorsConstants.splashText,
          ),
        ),
        leading: AutoLeadingButton(color: ColorsConstants.splashText),
        elevation: 3,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.grey[100],
              width: size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: buildTitle(),
            ),
            Container(
              color: Colors.grey[300],
              width: size.width,
              height: 300,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: buildImageList(),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: buildContent(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          galleryItems: widget.notice.images,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<NoticeImageModel> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            SafeArea(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  close();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: Icon(
                    Icons.exit_to_app_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final NoticeImageModel item = widget.galleryItems[index];
    String imgUrl = Endpoints.baseImageUrl + item.imageUrl;
    return PhotoViewGalleryPageOptions(
      imageProvider: NetworkImage(imgUrl),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }

  void close() {
    AutoRouter.of(context).pop();
  }
}
