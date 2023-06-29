import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/data/utils/Endpoints.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';

import '../../../../../../di/dependency_inection_graph.dart';
import '../../../../../utils/color_constants.dart';
import '../block/home_tab_bloc.dart';

class TopAreaComponent extends StatefulWidget {
  final double maxHeight;

  TopAreaComponent({Key? key, required this.maxHeight}) : super(key: key);

  @override
  State<TopAreaComponent> createState() => _TopAreaComponentState();
}

class _TopAreaComponentState extends State<TopAreaComponent> {
  late final HomeTabBloc homeTabBloc;
  late double backgroundHeight;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    homeTabBloc = locator.get<HomeTabBloc>()..add(HomeTabEventBannerImage());
    backgroundHeight = widget.maxHeight * 0.4;
  }

  @override
  void dispose() {
    super.dispose();
    homeTabBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: backgroundHeight,
      color: ColorsConstants.background,
      child: BlocBuilder<HomeTabBloc, HomeTabState>(
        bloc: homeTabBloc,
        builder: (_, state) {
          switch (state.runtimeType) {
            case HomeTabStateLoading:
              return const NetworkLoadingWidget();

            case HomeTabStateBannerImagesFailed:
              final errorMessage =
                  (state as HomeTabStateBannerImagesFailed).message;

              return NetworkErrorWidget(
                errorMessage: errorMessage,
              );

            case HomeTabStateBannerImages:
              final bannerImages =
                  (state as HomeTabStateBannerImages).bannerImages;

              return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            currentIndex = index;
                          },
                        );
                      },
                    ),
                    items: bannerImages
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                              ),
                              elevation: 6.0,
                              shadowColor: ColorsConstants.divider,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                child: Image.network(
                                  Endpoints.baseImageUrl + item.images,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerImages.map((urlOfItem) {
                      int index = bannerImages.indexOf(urlOfItem);
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 2.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index
                              ? Color.fromRGBO(0, 0, 0, 0.8)
                              : Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      );
                    }).toList(),
                  )
                ],
              );

            default:
              return const NetworkErrorWidget(
                errorMessage: '네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.',
              );
          }
        },
      ),
    );
  }
}
