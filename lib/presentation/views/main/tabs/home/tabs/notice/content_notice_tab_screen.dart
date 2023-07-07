import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/notice/bloc/content_notice_tab_bloc.dart';

class ContentNoticeTabScreen extends StatefulWidget {
  const ContentNoticeTabScreen({Key? key}) : super(key: key);

  @override
  State<ContentNoticeTabScreen> createState() => _ContentNoticeTabScreenState();
}

class _ContentNoticeTabScreenState extends State<ContentNoticeTabScreen> {
  @override
  Widget build(BuildContext context) {
    final contentNoticeTabBloc =
        BlocProvider.of<ContentNoticeTabBloc>(context).add(
      ContentNoticeTabNoticeListEvent(),
    );

    return Center(child: Text("공지사항"));
  }
}
