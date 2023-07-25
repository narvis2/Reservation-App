import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_create_request_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/views/common/bolder_text_widget.dart';
import 'package:reservation_app/presentation/views/common/network_error_widget.dart';
import 'package:reservation_app/presentation/views/common/network_loading_widget.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/fifth/reservation_fifth_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/utils/reservation_utils.dart';

class ReservationFifthProcessView extends StatefulWidget {
  const ReservationFifthProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationFifthProcessView> createState() =>
      _ReservationFifthProcessViewState();
}

class _ReservationFifthProcessViewState
    extends State<ReservationFifthProcessView> with TickerProviderStateMixin {
  late final ReservationBloc _reservationBloc;
  late final ReservationFifthBloc _reservationFifthBloc;

  late final AnimationController _rootViewAnimationController;

  @override
  void initState() {
    super.initState();
    _reservationBloc = BlocProvider.of<ReservationBloc>(context);
    _reservationFifthBloc = BlocProvider.of<ReservationFifthBloc>(context);

    _rootViewAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _rootViewAnimationController.forward();

    _reservationFifthBloc.add(
      ReservationFifthRequestCreateReservation(
        request: ReservationCreateRequestModel(
          name: _reservationBloc.state.authName,
          phoneNumber: _reservationBloc.state.authPhoneNumber,
          reservationDateTime: _reservationBloc.state.dateTime!,
          reservationCount: _reservationBloc.state.realUserCount,
          timeType: _reservationBloc.state.selectedTime,
          isTermAllAgree: _reservationBloc.state.termIsAllAgree,
          isUserValidation: _reservationBloc.state.isCheckedAuth,
          seat: _reservationBloc.state.selectedSeats,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rootViewAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReservationFifthBloc, ReservationFifthState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {

          },
          error: (errorMessage) {
          },
          succeed: () {
            SnackBarUtils.showCustomSnackBar(context, "예약에 성공하였습니다!");
          },
          orElse: () {

          }
        );
      },
      child: Expanded(
        child: BlocBuilder<ReservationFifthBloc, ReservationFifthState>(
          bloc: _reservationFifthBloc,
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return const NetworkLoadingWidget();
              },
              error: (errorMessage) {
                return NetworkErrorWidget(
                  errorMessage: errorMessage ?? Constants.dataError,
                );
              },
              succeed: () {
                return ScaleTransition(
                  scale: _rootViewAnimationController,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              bottom: 15,
                              left: 20,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorsConstants.strokeColor, // 테두리 색상 설정
                                width: 2.0, // 테두리 너비 설정
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/lottie/success_animation.json',
                                  animate: true,
                                  width: 100,
                                  height: 100,
                                  repeat: false,
                                ),
                                AnimatedTextKit(
                                  repeatForever: true,
                                  isRepeatingAnimation: true,
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                      "예약 성공!",
                                      textStyle: const TextStyle(
                                        fontSize: 25,
                                        color: ColorsConstants.strokeColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      colors: [
                                        Colors.black,
                                        Colors.blue,
                                        Colors.orange,
                                        Colors.red,
                                      ],
                                    ),
                                  ],
                                  onTap: () {
                                    debugPrint("Tap Event");
                                  },
                                ),
                                Container(
                                  constraints: BoxConstraints.expand(
                                    height: 20,
                                  ),
                                ),
                                Text(
                                  "${DateTimeUtils.dateTimeToString(
                                    pattern: "yyyy년 MM월 dd일",
                                    date: _reservationBloc.state.dateTime!,
                                  )} ${DateTimeUtils.dateTimeToWeekDay(
                                    date: _reservationBloc.state.dateTime!,
                                  )}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsConstants.strokeColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                BorderTextWidget(
                                  texts: [
                                    [
                                      ReservationUtils.partTimeToString(
                                        partTime:
                                            _reservationBloc.state.selectedTime,
                                      ),
                                      true,
                                    ],
                                    "시에",
                                  ],
                                  normalColors: ColorsConstants.divider,
                                  bolderColors: ColorsConstants.strokeColor,
                                  normalFontSize: 15,
                                  bolderFontSize: 16,
                                  bolderFontWeight: FontWeight.bold,
                                ),
                                BorderTextWidget(
                                  texts: [
                                    [
                                      ReservationUtils.reservationCountToString(
                                        count: _reservationBloc
                                            .state.selectedCount,
                                        realUserCount: _reservationBloc
                                            .state.realUserCount,
                                      ),
                                      true,
                                    ],
                                    "으로",
                                  ],
                                  normalColors: ColorsConstants.divider,
                                  bolderColors: ColorsConstants.strokeColor,
                                  normalFontSize: 15,
                                  bolderFontSize: 16,
                                  bolderFontWeight: FontWeight.bold,
                                ),
                                BorderTextWidget(
                                  texts: [
                                    ['예약', true],
                                    '이 ',
                                    ['완료', true],
                                    '되었습니다.'
                                  ],
                                  normalColors: ColorsConstants.divider,
                                  bolderColors: ColorsConstants.divider,
                                  normalFontSize: 15,
                                  bolderFontSize: 15,
                                  bolderFontWeight: FontWeight.w600,
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints.expand(height: 20.0),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      AutoRouter.of(context).back();
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            50.0,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        ColorsConstants.strokeColor,
                                      ),
                                    ),
                                    child: Text(
                                      "확인",
                                      style: TextStyle(
                                        color: ColorsConstants.background,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(
                              top: 20,
                              left: 20,
                              bottom: 20,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: ColorsConstants.guideBackground,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 7, top: 7),
                                      width: 2,
                                      height: 2,
                                      color: ColorsConstants.guideText,
                                    ),
                                    Flexible(
                                      child: BorderTextWidget(
                                        texts: [
                                          ['예약', true],
                                          '안내 ',
                                          ['문자', true],
                                          '가 발송됩니다.',
                                          ['안내문자', true],
                                          '를 확인해주세요!'
                                        ],
                                        normalColors: ColorsConstants.guideText,
                                        bolderColors: ColorsConstants.guideText,
                                        normalFontSize: 13,
                                        bolderFontSize: 13,
                                        letterSpacing: -0.02,
                                        bolderFontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }, // 어떠한 상태도 없는 경우 대응
              orElse: () {
                return SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
