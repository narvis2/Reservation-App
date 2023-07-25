import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/widget/reservation_select_count_widget.dart';
import 'package:reservation_app/presentation/views/reservation/widget/reservation_select_date_widget.dart';
import 'package:reservation_app/presentation/views/reservation/widget/reservation_select_time_widget.dart';

class ReservationFirstProcessView extends StatefulWidget {
  const ReservationFirstProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationFirstProcessView> createState() =>
      _ReservationFirstProcessViewState();
}

class _ReservationFirstProcessViewState
    extends State<ReservationFirstProcessView>
    with TickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;
  late final AnimationController _animationUseCountController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationUseCountController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    _animationUseCountController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500), // 스크롤 애니메이션 소요 시간
      curve: Curves.easeOut, // 스크롤 애니메이션 효과
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReservationBloc, ReservationState>(
      listener: (context, state) {
        if (state.dateTime != null) {
          _animationController.forward();
          _animationUseCountController.forward();
        } else {
          _animationController.reverse();
          _animationUseCountController.reverse();
        }
      },
      child: Expanded(
        child: Container(
          margin: EdgeInsets.all(15.0),
          width: double.infinity,
          child: ListView(
            controller: _scrollController,
            children: [
              Text(
                '예약 날짜/시간 선택',
                style: TextStyle(
                  color: ColorsConstants.divider,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child:
                    BlocSelector<ReservationBloc, ReservationState, DateTime?>(
                  selector: (state) {
                    return state.dateTime;
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        ReservationSelectDateWidget(),
                        // 날짜 선택
                        Container(
                          constraints: const BoxConstraints.expand(
                            height: 10.0,
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            // 왼쪽에서 오른쪽으로 이동하는 애니메이션
                            final slideAnimation = Tween<Offset>(
                              begin: Offset(-1.0, 0.0),
                              end: Offset(0.0, 0.0),
                            ).animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOut,
                            ));

                            return Visibility(
                              visible: state != null,
                              child: SlideTransition(
                                position: slideAnimation,
                                child: ReservationSelectTimeWidget(), // 시간 선택
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              Divider(
                height: 10,
                thickness: 2,
              ),
              Container(
                constraints: const BoxConstraints.expand(height: 10.0),
              ),
              Text(
                "예약 인원수",
                style: TextStyle(
                  color: ColorsConstants.divider,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                constraints: const BoxConstraints.expand(height: 10.0),
              ),
              AnimatedBuilder(
                  animation: _animationUseCountController,
                  builder: (context, child) {
                    // 왼쪽에서 오른쪽으로 이동하는 애니메이션
                    final slideAnimation = Tween<Offset>(
                      begin: Offset(-1.0, 0.0),
                      end: Offset(0.0, 0.0),
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOut,
                    ));

                    return SlideTransition(
                      position: slideAnimation,
                      child: ReservationSelectCountWidget(
                        onScrollBottom: () {
                          scrollToBottom();
                        },
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
