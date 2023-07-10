import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/dialog_utils.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';

class CloseFloatingActionWidget extends StatefulWidget {
  const CloseFloatingActionWidget({Key? key}) : super(key: key);

  @override
  State<CloseFloatingActionWidget> createState() =>
      _CloseFloatingActionWidgetState();
}

class _CloseFloatingActionWidgetState extends State<CloseFloatingActionWidget>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late final AnimationController _animationController;
  late final Animation<Color?> _animateColor;
  late final Animation<double> _animateIcon;
  final Curve _curve = Curves.easeOut;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animateColor = ColorTween(
      begin: ColorsConstants.splashText,
      end: ColorsConstants.inProgressColor,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationBloc, ReservationState>(
      // 이전값과 현재값을 비교하여 true 일 경우에만 listener 실행됨
      listenWhen: (previous, current) {
          // 첫 번째 Process 이고 선택된 예약날짜가 null 이 아니면 listener 시작
          return _animateIcon.value == 0 &&
              current.currentPosition == 0 &&
              (current.dateTime != null || previous.dateTime != null);
      },
      listener: (context, state) {
        // X 버튼을 다음 버튼으로 바꿔줌
        animate();
      }, // 이전값과 연재값을 비교하여 true 일 경우에만 builder 실행됨
      buildWhen: (previous, current) {
        // FloatingActionButton 은 항상 보여야 하므로 true
        return true;
      },
      builder: (context, state) {
        return FloatingActionButton(
          backgroundColor: _animateColor.value,
          onPressed: () {
              if (_animateIcon.value == 0) {
                DialogUtils.showBasicDialog(
                  context: context,
                  title: "알림",
                  message: "예약날짜를 선택해 주세요.",
                );

                return;
              }

              context.read<ReservationBloc>().add(
                    ReservationProcessEvent(
                      processIndex: (state.currentPosition + 1) %
                          Constants.reservationProcessList.length,
                    ),
                  );
          },
          child: AnimatedIcon(
            icon: _animateIcon.value == 0
                ? AnimatedIcons.close_menu
                : AnimatedIcons.pause_play,
            progress: _animateIcon,
          ),
        );
      },
    );
  }
}
