import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/di/dependency_injection_graph.dart';
import 'package:reservation_app/presentation/config/router/app_router.dart';
import 'package:reservation_app/presentation/views/app/bloc/app_info_bloc.dart';
import 'package:reservation_app/presentation/views/user/bloc/user_info_bloc.dart';

import '../../../di/prefs/shared_pref_module.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AppInfoBloc _appInfoBloc;
  late final UserInfoBloc _userInfoBloc;

  // di 를 이용해서 가져오기
  final SharedPreferenceModule pref = locator.get();

  Future<Timer> startSplash() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, navigate);
  }

  void navigate() async {
    _appInfoBloc = BlocProvider.of<AppInfoBloc>(context)
      ..add(AppInfoGetEvent());

    _userInfoBloc = BlocProvider.of<UserInfoBloc>(context)
      ..add(UserInfoInitEvent());

    String? accessToken = await pref.accessToken;

    if (!mounted) return;
    debugPrint("token 👉 $accessToken");

    if (accessToken != null) {
      AutoRouter.of(context).replace(const MainRoute());
    } else {
      AutoRouter.of(context).replace(const MainRoute());
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .requestPermission(
          badge: true,
          alert: true,
          sound: true,
        )
        .then((value) => {startSplash()});
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // 화면 가운데에서 -50으로 좌표 계산
    final double topPosition = screenHeight / 2 + 70;

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Center(
              child: TextLiquidFill(
                text: '우회담',
                boxBackgroundColor: Colors.white,
                waveColor: const Color(0xFF9B111E),
                textStyle: const TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 300.0,
                loadDuration: const Duration(seconds: 5),
              ),
            ),
            Positioned(
              top: topPosition,
              child: SizedBox(
                width: screenWidth,
                child: Align(
                  alignment: Alignment.center,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        '한우를 메인으로 요리를 선보이며 대화를 나누는 공간',
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xCC9B111E),
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
