
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/app/bloc/app_info_bloc.dart';

class AppVersionWidget extends StatefulWidget {
  const AppVersionWidget({Key? key}) : super(key: key);

  @override
  State<AppVersionWidget> createState() => _AppVersionWidgetState();
}

class _AppVersionWidgetState extends State<AppVersionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "앱 버전",
            style: TextStyle(
              fontSize: 14,
              color: ColorsConstants.boldColor,
            ),
          ),
          BlocSelector<AppInfoBloc, AppInfoState, String>(
            selector: (state) {
              return state.appInfo?.version ?? '';
            },
            builder: (context, state) {
              return Text(
                state,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorsConstants.strokeColor,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
