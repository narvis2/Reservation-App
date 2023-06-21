import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/views/main/block/main_bloc.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final mainBlock = BlocProvider.of<MainBloc>(context);

    return Scaffold(body: BlocBuilder<MainBloc, MainState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case MainStateLoading:
            return const Center(child: CupertinoActivityIndicator());
          case MainStateBannerImagesFailed:
            return const Center(child: Icon(Icons.refresh));
          case MainStateBannerImages:
            return const Scaffold(
                body: SafeArea(
                    child: Center(
                        child: Text("Welcome Home"),
                    )
                )
            );
          default:
            return const SizedBox();
        }
      },
    ));
  }
}
