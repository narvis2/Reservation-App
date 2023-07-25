import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/domain/model/notice/notice_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

@RoutePage()
class NoticeDetailScreen extends StatefulWidget {
  const NoticeDetailScreen({required this.notice});

  final NoticeModel notice;
  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // debugPrint("notice => ${widget.notice}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: AutoLeadingButton(color: ColorsConstants.splashText),
          elevation: 3,
        ),
        body: const SafeArea(
            child: Center(
          child: Text("Notice Screen"),
        )));
  }
}
