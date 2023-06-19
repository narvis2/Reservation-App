
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/di/dependency_inection_graph.dart';
import 'package:reservation_app/presentation/config/router/app_router.dart';

import '../../../di/prefs/shared_pref_module.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // di 를 이용해서 가져오기
  final SharedPreferenceModule pref = locator.get();

  startSplash() async {
    return Timer(const Duration(seconds: 2), (){
      /**
       * 📌 지금은 Token 이 있든 없든 무조건 Main 2초뒤에 으로 가도록 설정
       */
      if (pref.getJWTToken().isNotEmpty){
        AutoRouter.of(context).replace(const MainRoute());
      } else {
        // TODO:: Token 이 없는 경우 대응
        AutoRouter.of(context).replace(const MainRoute());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startSplash();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(
        child: Text("Splash screen"),
      ))
    );
  }
}