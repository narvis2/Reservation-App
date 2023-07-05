import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

@RoutePage()
class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  final List<String> items = List<String>.generate(50, (i) => '$i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('알림', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: AutoLeadingButton(color: ColorsConstants.splashText),
          elevation: 3,
        ),
        body: Center(child: Text("test")));
    // ListView.builder(
    //     itemBuilder: (context, index) {
    //       return Slidable(
    //         key: const ValueKey(0),
    //         startActionPane: ActionPane(
    //           motion: const DrawerMotion(),
    //           children: [
    //             SlidableAction(
    //               onPressed: (BuildContext context) {
    //                 setState(() {
    //                   items.removeAt(index);
    //                 });
    //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //                     content: Text('${items[index]} 번째 알림 삭제')));
    //               },
    //               backgroundColor: Color(0xFFFE4A49),
    //               foregroundColor: Colors.white,
    //               icon: Icons.delete,
    //               label: '삭제',
    //             ),
    //             SlidableAction(
    //               onPressed: (BuildContext context) {
    //                 setState(() {});
    //               },
    //               backgroundColor: Color(0xFF21B7CA),
    //               foregroundColor: Colors.white,
    //               icon: Icons.share,
    //               label: '공유',
    //             ),
    //           ],
    //         ),
    //         endActionPane: ActionPane(
    //           motion: const DrawerMotion(),
    //           children: [
    //             SlidableAction(
    //               onPressed: (BuildContext context) {
    //                 setState(() {});
    //               },
    //               backgroundColor: Color(0xFF0392CF),
    //               foregroundColor: Colors.white,
    //               icon: Icons.save,
    //               label: '저장',
    //             ),
    //           ],
    //         ),
    //         child: ListTile(
    //           leading: Icon(Icons.beenhere_rounded),
    //           title: Text('${items[index + 1]}번째 알림'),
    //           trailing: Icon(Icons.timeline),
    //           selectedTileColor: Colors.amber,
    //         ),
    //       );
    //     },
    //     itemCount: 30)));
  }
}
