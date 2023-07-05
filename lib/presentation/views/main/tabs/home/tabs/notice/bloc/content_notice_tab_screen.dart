import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/di/dependency_inection_graph.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/notice/bloc/bloc/content_notice_tab_bloc.dart';

class Notice {
  String title = "";
  String content = "";
  String createTime = "";
  List<String> images = [];

  Notice(this.title, this.content, this.createTime, this.images);
}

class ContentNoticeTabScreen extends StatefulWidget {
  const ContentNoticeTabScreen({Key? key}) : super(key: key);

  @override
  State<ContentNoticeTabScreen> createState() => _ContentNoticeTabScreenState();
}

class _ContentNoticeTabScreenState extends State<ContentNoticeTabScreen> {
  late final List<Notice> noticeList;
  @override
  void initState() {
    super.initState();
    noticeList = [
      Notice("공지사항1", "공지사항 1번 내용", "2023/07/05 00:43:00",
          ["assets/images/logo_beige.png"]),
      Notice("공지사항2", "공지사항 2번 내용", "2023/07/06 00:43:00",
          ["assets/images/logo_green.png"])
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contentNoticeTabBloc = BlocProvider.of<ContentNoticeTabBloc>(context)
      ..add(ContentNoticeTabAllNotice());

    return BlocBuilder<ContentNoticeTabBloc, ContentNoticeTabState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Expandable Demo"),
          ),
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
                  return Card1(
                    title: notice.title,
                    content: notice.content,
                    createTime: notice.createTime,
                    images: notice.images,
                  );
                }
                //   [
                //   Card2(),
                // ],
                ),
          ),
        );
      },
    );
  }
  //   return Container(
  //     margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
  //     color: ColorsConstants.background,
  //     child: BlocBuilder<ContentNoticeTabBloc, ContentNoticeTabState>(
  //         bloc: _contentNoticeTabBloc,
  //         builder: (context, state) {
  //           switch (state.runtimeType) {
  //             case ContentNoticeTabStateLoading:
  //               return const NetworkLoadingWidget();

  //             case ContentNoticeTabStateAllNoticeFailed:
  //               final errorMessage =
  //                   (state as ContentNoticeTabStateAllNoticeFailed).message;
  //               return NetworkErrorWidget(
  //                 errorMessage: errorMessage,
  //               );

  //             case ContentNoticeTabStateAllNotice:
  //               final List<NoticeModel> noticeList =
  //                   (state as ContentNoticeTabStateAllNotice).noticeList;

  //               return LayoutBuilder(
  //                 builder: (context, constraints) {
  //                   return ConstrainedBox(
  //                     constraints: BoxConstraints(
  //                       minHeight: constraints.maxHeight,
  //                     ),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Container(
  //                           constraints:
  //                               const BoxConstraints.expand(height: 5.0),
  //                         ),
  //                         Expanded(
  //                           child:
  //                               ListView.builder(itemBuilder: (context, index) {
  //                             return Row(
  //                               key: const ValueKey(0),
  //                               children: [
  //                                 ListTile(title: Text(noticeList[index].title))
  //                               ],
  //                             );
  //                           }),
  //                         ),
  //                       ],
  //                     ),
  //                   );
  //                 },
  //               );

  //             default:
  //               return const NetworkErrorWidget(
  //                 errorMessage: '네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.',
  //               );
  //           }
  //         }),
  //   );
  // }
}

class Card1 extends StatefulWidget {
  const Card1({
    Key? key,
    required this.title,
    required this.content,
    required this.createTime,
    required this.images,
  }) : super(key: key);

  final String title;
  final String content;
  final String createTime;
  final List<String> images;

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(1),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            SizedBox(height: 150, child: Image.asset(widget.images[0])),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                collapsed: Text(
                  widget.createTime,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (var _ in Iterable.generate(5))
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.content,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

// class Card2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }

//     buildCollapsed1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildCollapsed2() {
//       return buildImg(Colors.lightGreenAccent, 150);
//     }

//     buildCollapsed3() {
//       return Container();
//     }

//     buildExpanded1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   Text(
//                     "3 Expandable widgets",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildExpanded2() {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//               Expanded(child: buildImg(Colors.orange, 100)),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightBlue, 100)),
//               Expanded(child: buildImg(Colors.cyan, 100)),
//             ],
//           ),
//         ],
//       );
//     }

//     buildExpanded3() {
//       return Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               loremIpsum,
//               softWrap: true,
//             ),
//           ],
//         ),
//       );
//     }

//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//       child: ScrollOnExpand(
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expandable(
//                 collapsed: buildCollapsed1(),
//                 expanded: buildExpanded1(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed2(),
//                 expanded: buildExpanded2(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed3(),
//                 expanded: buildExpanded3(),
//               ),
//               Divider(
//                 height: 1,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Builder(
//                     builder: (context) {
//                       var controller =
//                           ExpandableController.of(context, required: true)!;
//                       return TextButton(
//                         child: Text(
//                           controller.expanded ? "COLLAPSE" : "EXPAND",
//                           style: Theme.of(context)
//                               .textTheme
//                               .button!
//                               .copyWith(color: Colors.deepPurple),
//                         ),
//                         onPressed: () {
//                           controller.toggle();
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
