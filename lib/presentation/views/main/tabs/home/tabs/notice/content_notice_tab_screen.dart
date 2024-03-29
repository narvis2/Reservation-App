import 'package:auto_route/auto_route.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/data/utils/Endpoints.dart';
import 'package:reservation_app/domain/model/notice/image/notice_image_model.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/presentation/config/router/app_router.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/notice/bloc/content_notice_tab_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/notice/component/gallery_item_thumbnail.dart';

class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}

class ContentNoticeTabScreen extends StatefulWidget {
  const ContentNoticeTabScreen({Key? key}) : super(key: key);

  @override
  State<ContentNoticeTabScreen> createState() => _ContentNoticeTabScreenState();
}

class _ContentNoticeTabScreenState extends State<ContentNoticeTabScreen> {
  @override
  Widget build(BuildContext context) {
    final contentNoticeTabBloc = BlocProvider.of<ContentNoticeTabBloc>(context)
      ..add(
        ContentNoticeTabNoticeListEvent(),
      );

    return Container(
      color: ColorsConstants.background,
      child: BlocBuilder<ContentNoticeTabBloc, ContentNoticeTabState>(
          bloc: contentNoticeTabBloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case ContentNoticeTabStateLoading:
                return const NetworkLoadingWidget();

              case ContentNoticeTabStateNoticeListFailed:
                final errorMessage =
                    (state as ContentNoticeTabStateNoticeListFailed).message;
                return NetworkErrorWidget(
                  errorMessage: errorMessage,
                );

              case ContentNoticeTabStateNoticeList:
                final List<NoticeModel> noticeList =
                    (state as ContentNoticeTabStateNoticeList).noticeList;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    return Scaffold(
                      body: ExpandableTheme(
                        data: const ExpandableThemeData(
                          iconColor: Colors.blue,
                          useInkWell: true,
                        ),
                        child: ListView.builder(
                          itemCount: noticeList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final notice = noticeList[index];
                            notice.createdAt.replaceAll("T", " / ");
                            return CustomCard(notice: notice);
                          },
                        ),
                      ),
                    );
                  },
                );

              default:
                return const NetworkErrorWidget(
                  errorMessage: '네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.',
                );
            }
          }),
    );
  }
}

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, required this.notice}) : super(key: key);
  final NoticeModel notice;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  CustomPopupMenuController popupController = CustomPopupMenuController();

  List<ItemModel> menuItems = [
    ItemModel("펼치기", Icons.open_in_browser_rounded),
    ItemModel("상세보기", Icons.developer_board_rounded),
    ItemModel("수정", Icons.auto_fix_high_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    buildPressMenu(
        BuildContext context, CustomPopupMenuController popupController) {
      var expandController = ExpandableController.of(context, required: true)!;

      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 110,
          height: 120,
          color: Colors.black,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    width: 110,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          expandController.toggle();
                        } else if (index == 1) {
                          AutoRouter.of(context)
                              .push(NoticeDetailRoute(notice: widget.notice));
                        }
                        popupController.hideMenu();
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            menuItems[index].icon,
                            size: 20,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              menuItems[index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ));
              }),
        ),
      );
    }

    buildCollapsedTop() {
      return Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
        child: Text(
          widget.notice.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          softWrap: false,
        ),
      );
    }

    buildExpandedTop() {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
          child: Text(
            widget.notice.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    buildCollapsedMiddle() {
      if (widget.notice.images.isEmpty) {
        return SizedBox.shrink();
      } else {
        return Image.network(
          Endpoints.baseImageUrl + widget.notice.images[0].imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        );
      }
    }

    buildExpandedMiddle(List<NoticeImageModel> images) {
      if (images.isNotEmpty) {
        return Column(
          children: images
              .asMap()
              .entries
              .map((item) => Row(children: [
                    GalleryItemThumbnail(
                      galleryExampleItem: item.value,
                    )
                  ]))
              .toList(),
        );
      } else {
        return SizedBox.shrink();
      }
    }

    buildCollapsedBottom() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                widget.notice.createdAt,
                softWrap: true,
                overflow: TextOverflow.fade,
              )),
          Builder(builder: (context) {
            return CustomPopupMenu(
              menuBuilder: () => buildPressMenu(context, popupController),
              pressType: PressType.singleClick,
              verticalMargin: -15,
              controller: popupController,
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Icon(Icons.more_vert_sharp),
              ),
            );
          }),
        ],
      );
    }

    buildExpandedBottom() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                // widget.notice.content
                Constants.noticeContentSample,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              )),
          Builder(builder: (context) {
            var controller = ExpandableController.of(context, required: true)!;

            return Center(
              child: IconButton(
                onPressed: () {
                  controller.toggle();
                },
                icon: Icon(Icons.arrow_drop_up),
                iconSize: 30,
              ),
            );
          }),
        ],
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expandable(
                  collapsed: buildCollapsedTop(),
                  expanded: buildExpandedTop(),
                ),
                Expandable(
                  collapsed: buildCollapsedMiddle(),
                  expanded: buildExpandedMiddle(widget.notice.images),
                ),
                Divider(
                  height: 1,
                ),
                Expandable(
                  collapsed: buildCollapsedBottom(),
                  expanded: buildExpandedBottom(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
