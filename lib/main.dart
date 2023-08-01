import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:reservation_app/presentation/config/router/app_router.dart';
import 'package:reservation_app/presentation/config/themes/app_theme.dart';
// import 'package:reservation_app/presentation/views/fcm/bloc/fcm_bloc.dart';
import 'package:reservation_app/presentation/views/main/block/main_bloc.dart';
import 'package:reservation_app/presentation/views/network/bloc/network_bloc.dart';

import 'di/dependency_inection_graph.dart';
import 'firebase_options.dart';
import 'presentation/views/fcm/bloc/fcm_bloc.dart';
import 'presentation/views/main/tabs/home/tabs/notice/bloc/content_notice_tab_bloc.dart';

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

  await NaverMapSdk.instance.initialize(
      clientId: 'sz1yl84rs6',
      onAuthFailed: (error) {
        debugPrint('💛 Naver ClientId Auth failed 👉 $error');
      });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // 여기에 등록하면 앱 전역에서 사용가능 SharedViewModel 이라고 생각하면 될듯
        providers: [
          BlocProvider<MainBloc>(
            create: (context) => locator<MainBloc>(),
          ),
          BlocProvider<NetworkBloc>(
            create: (create) => locator<NetworkBloc>(),
          ),
          BlocProvider<FcmBloc>(
            create: (create) => locator<FcmBloc>()..add(FcmInit()),
          ),
          BlocProvider<ContentNoticeTabBloc>(
            create: (create) => locator<ContentNoticeTabBloc>(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            // 다국어 설정
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale('ko', 'KR'),
          // 대한민국 언어 설정
          supportedLocales: [
            const Locale('en', 'US'), // English
            const Locale('ko', 'KR'), // 대한민국 언어 설정
          ],
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          title: "우회담 예약 어플",
          theme: AppTheme.light,
        ),
    );
  }
}
