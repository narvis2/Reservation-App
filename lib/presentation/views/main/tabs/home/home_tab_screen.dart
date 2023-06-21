
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/di/dependency_inection_graph.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/block/home_tab_bloc.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  late final HomeTabBloc homeTabBloc;

  @override
  void initState() {
    super.initState();
    homeTabBloc = locator.get<HomeTabBloc>()..add(HomeTabEventBannerImage());
  }

  @override
  void dispose() {
    super.dispose();
    homeTabBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabBloc, HomeTabState>(
      bloc: homeTabBloc,
      builder: (_, state) {
        switch (state.runtimeType) {
          case HomeTabStateLoading:
            return const Center(child: CupertinoActivityIndicator());
          case HomeTabStateBannerImagesFailed:
            return const Center(child: Icon(Icons.refresh));
          case HomeTabStateBannerImages:
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
    );
  }
}
