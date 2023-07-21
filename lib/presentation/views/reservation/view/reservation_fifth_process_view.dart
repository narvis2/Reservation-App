import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:reservation_app/domain/model/reservation/request/reservation_create_request_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
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
    extends State<ReservationFifthProcessView> {
  late final ReservationBloc _reservationBloc;
  late final ReservationFifthBloc _reservationFifthBloc;

  @override
  void initState() {
    super.initState();
    _reservationBloc = BlocProvider.of<ReservationBloc>(context);
    _reservationFifthBloc = BlocProvider.of<ReservationFifthBloc>(context);

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
  Widget build(BuildContext context) {
    return Expanded(
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
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: 15,
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsConstants.strokeColor,
                        // 테두리 색상 설정
                        width: 2.0, // 테두리 너비 설정
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/lottie/success_animation.json',
                          animate: true,
                          width: 100,
                          height: 100,
                          repeat: false,
                        ),
                        AnimatedTextKit(
                          repeatForever: false,
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            FadeAnimatedText(
                              "예약 성공!",
                              textStyle: const TextStyle(
                                fontSize: 25,
                                color: ColorsConstants.strokeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          onTap: () {
                            debugPrint("Tap Event");
                          },
                        ),
                        AnimatedTextKit(
                          repeatForever: true,
                          isRepeatingAnimation: true,
                          animatedTexts: [
                            ColorizeAnimatedText(
                              "감사합니다!",
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
                                partTime: _reservationBloc.state.selectedTime,
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
                                count: _reservationBloc.state.selectedCount,
                                realUserCount:
                                    _reservationBloc.state.realUserCount,
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
                          constraints: BoxConstraints.expand(
                            height: 10,
                          ),
                        ),
                        BorderTextWidget(
                          texts: [
                            ['예약', true],
                            '안내 ',
                            ['문자', true],
                            '가 발송됩니다.'
                          ],
                          normalColors: ColorsConstants.divider,
                          bolderColors: ColorsConstants.divider,
                          normalFontSize: 15,
                          bolderFontSize: 15,
                          bolderFontWeight: FontWeight.w600,
                        ),
                        BorderTextWidget(
                          texts: [
                            ['안내문자', true],
                            '를 ',
                            '확인해주세요!'
                          ],
                          normalColors: ColorsConstants.divider,
                          bolderColors: ColorsConstants.divider,
                          normalFontSize: 15,
                          bolderFontSize: 15,
                          bolderFontWeight: FontWeight.w600,
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
    );
  }
}
