import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/utils/date_time_utils.dart';
import 'package:reservation_app/presentation/utils/snack_bar_utils.dart';
import 'package:reservation_app/presentation/utils/text_utils.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/fourth/reservation_fourth_bloc.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/reservation_bloc.dart';

class ReservationFourthProcessView extends StatefulWidget {
  const ReservationFourthProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationFourthProcessView> createState() =>
      _ReservationFourthProcessViewState();
}

class _ReservationFourthProcessViewState
    extends State<ReservationFourthProcessView> with TickerProviderStateMixin {
  late final ReservationBloc reservationBloc;
  late final ReservationFourthBloc reservationFourthBloc;

  final _formKey = GlobalKey<FormState>();
  final _nameKey = GlobalKey<FormFieldState>();
  final _phoneNumberKey = GlobalKey<FormFieldState>();
  final _authPhoneNumberKey = GlobalKey<FormFieldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _authNumberController = TextEditingController();

  late final AnimationController _rootViewAnimationController;
  late final AnimationController _phoneNumberAnimationController;
  late final AnimationController _authCodeAnimationController;

  final List<FocusNode> _focusNodes = List.generate(3, (index) => FocusNode());

  int _durationInSeconds = 3 * 60; // 5 분에서 시작
  Timer? _timer;

  bool _isRootAnimationRevers = false;
  bool _isNameValidate = false;
  bool _isPhoneNumberValidate = false;
  bool _isAuthCodeValidate = false;

  @override
  void initState() {
    super.initState();
    reservationBloc = BlocProvider.of<ReservationBloc>(context);
    reservationFourthBloc  = BlocProvider.of<ReservationFourthBloc>(context);

    _rootViewAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener((status) {
      if (status == AnimationStatus.dismissed && _isRootAnimationRevers) {
        reservationBloc.add(
          ReservationProcessEvent(
            processIndex: (reservationBloc.state.currentPosition + 1) %
                Constants.reservationProcessList.length,
          ),
        );
      }
    });

    _onRootAnimationForward();

    _phoneNumberAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _authCodeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _onRootAnimationForward() {
    setState(() {
      _isRootAnimationRevers = false;
    });
    _rootViewAnimationController.forward();
  }

  void _onRootAnimationReverse() {
    setState(() {
      _isRootAnimationRevers = true;
    });
    _rootViewAnimationController.reverse();
  }

  bool _isFocusInput(int index) {
    return _focusNodes[index].hasFocus;
  }

  void _onFocusOutInput(int index) {
    if (_isFocusInput(index)) {
      _focusNodes[index].unfocus();
    }
  }

  void _onFocusInput(BuildContext context, int index) {
    if (!_isFocusInput(index)) {
      FocusScope.of(context).requestFocus(_focusNodes[index]);
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // 타이머 진행 시간을 업데이트하여 화면에 반영
        _durationInSeconds--;

        if (_durationInSeconds == 0) {
          _stopTimer();
          // 타이머가 완료되었을 때 동작
          SnackBarUtils.showCustomSnackBar(
            context,
            "인증번호가 만료되었습니다. 인증번호를 재발급 해주세요.",
          );
        }
      });
    });
  }

  void _stopTimer() {
    final currentTimer = _timer;
    if (currentTimer != null && currentTimer.isActive) {
      currentTimer.cancel();
    }
  }

  void _restartTimer() {
    _stopTimer(); // 기존 타이머를 중지
    setState(() {
      _durationInSeconds = 3 * 60; // 타이머 시간을 다시 5분으로 설정
      _timer = null; // _timer 변수를 null 로 초기화
    });
    _startTimer(); // 타이머를 다시 시작
  }

  @override
  void dispose() {
    _rootViewAnimationController.dispose();
    _stopTimer();
    _nameController.dispose();
    _phoneController.dispose();
    _authNumberController.dispose();
    _phoneNumberAnimationController.dispose();
    _authCodeAnimationController.dispose();
    for (var node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final allFocus = FocusScope.of(context);
          if (allFocus.hasFocus) {
            allFocus.unfocus();
          }
        },
        child: BlocListener<ReservationFourthBloc, ReservationFourthState>(
          listener: (context, state) {
            if (state.reqAuthNumberStatus == RequestAuthNumberStatus.success &&
                state.isRequestSuccess) {
              SnackBarUtils.showCustomSnackBar(context, "인증 번호를 보냈습니다.");

              if (_isFocusInput(2)) {
                _timer == null ? _startTimer() : _restartTimer();
                return;
              }

              final allFocus = FocusScope.of(context);
              if (allFocus.hasFocus) {
                allFocus.unfocus();
              }

              _onFocusInput(context, 2);
              _timer == null ? _startTimer() : _restartTimer();

              _authCodeAnimationController.forward();
              return;
            }

            if (state.checkAuthNumberStatus == CheckAuthNumberStatus.success) {
              if (state.isCheckSuccess) {
                SnackBarUtils.showCustomSnackBar(context, "인증 완료되었습니다.");

                final allFocus = FocusScope.of(context);
                if (allFocus.hasFocus) {
                  allFocus.unfocus();
                }

                _stopTimer();
                reservationBloc.add(
                  ReservationUserAuthEvent(
                    authName: _nameController.text,
                    authPhoneNumber: _phoneController.text,
                    isCheckedAuth: true,
                  ),
                );
                _onRootAnimationReverse();
              } else {
                SnackBarUtils.showCustomSnackBar(
                  context,
                  "인증에 실패하였습니다. 다시 시도해주세요.",
                );
                reservationBloc.add(
                  ReservationUserAuthEvent(
                    authName: '',
                    authPhoneNumber: '',
                    isCheckedAuth: false,
                  ),
                );
              }
            } else if (state.checkAuthNumberStatus ==
                CheckAuthNumberStatus.error) {
              SnackBarUtils.showCustomSnackBar(
                context,
                "인증에 실패하였습니다. 다시 시도해주세요.",
              );
              reservationBloc.add(
                ReservationUserAuthEvent(
                  authName: '',
                  authPhoneNumber: '',
                  isCheckedAuth: false,
                ),
              );
            }
          },
          child: ScaleTransition(
            scale: _rootViewAnimationController,
            child: Container(
              margin: EdgeInsets.only(
                top: 20.0,
                left: 30.0,
                right: 30.0,
                bottom: 20.0,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        constraints: const BoxConstraints.expand(height: 10),
                      ),
                      TextFormField(
                        key: _nameKey,
                        controller: _nameController,
                        focusNode: _focusNodes[0],
                        autovalidateMode: AutovalidateMode.always,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          _onFocusOutInput(0);
                          if (!_isPhoneNumberValidate) {
                            _onFocusInput(context, 1);
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            _isNameValidate = value.isNotEmpty &&
                                value.length > 2 &&
                                TextUtils.isNameValid(value);

                            if (_isNameValidate) {
                              _phoneNumberAnimationController.forward();
                            } else {
                              _phoneNumberAnimationController.reverse();
                            }
                          });
                        },
                        validator: (value) {
                          final text = value;
                          if (text == null || text.isEmpty || text.length < 2) {
                            return '2~4자 이내의 문자';
                          }

                          if (text.isNotEmpty && !TextUtils.isNameValid(text)) {
                            return '2~4자 이내로 제대로된 성함을 입력해 주세요.';
                          }

                          return null;
                        },
                        maxLength: 4,
                        inputFormatters: [
                          // 한글 자판만 허용 (숫자, 영어, 이모티콘 다 안됨)
                          FilteringTextInputFormatter.allow(RegExp('[ㄱ-ㅣ가-힣]*')),
                        ],
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => _nameController.clear(),
                            child: Icon(
                              Icons.cancel,
                              color: ColorsConstants.boldColor,
                              size: 20,
                            ),
                          ),
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: ColorsConstants.strokeColor,
                          helperText: "2~4자 이내의 문자",
                          helperStyle: TextStyle(
                            color: ColorsConstants.strokeColor,
                          ),
                          iconColor: ColorsConstants.strokeColor,
                          hintText: '예약자 성함을 입력해주세요.',
                          hintStyle: TextStyle(
                            color: ColorsConstants.textHint,
                            fontSize: 15,
                          ),
                          labelText: '예약자 성함',
                          labelStyle: TextStyle(
                            color: ColorsConstants.strokeColor,
                            fontSize: 14,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: ColorsConstants.primary,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: ColorsConstants.primary,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color:
                                  ColorsConstants.primaryButtonBackgroundDisabled,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: ColorsConstants.strokeColor,
                              width: 1,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        style: TextStyle(
                          color: ColorsConstants.boldColor,
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 25.0),
                      ),
                      AnimatedBuilder(
                        animation: _phoneNumberAnimationController,
                        builder: (context, child) {
                          final slideAnimation = Tween<Offset>(
                            begin: Offset(-1.0, 0.0),
                            end: Offset(0.0, 0.0),
                          ).animate(CurvedAnimation(
                            parent: _phoneNumberAnimationController,
                            curve: Curves.easeInOut,
                          ));

                          return Visibility(
                            visible: _isNameValidate,
                            child: SlideTransition(
                              position: slideAnimation,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: TextFormField(
                                      key: _phoneNumberKey,
                                      controller: _phoneController,
                                      focusNode: _focusNodes[1],
                                      autovalidateMode: AutovalidateMode.always,
                                      onChanged: (value) {
                                        setState(() {
                                          _isPhoneNumberValidate = value
                                                  .isNotEmpty &&
                                              value.length > 10 &&
                                              TextUtils.isPhoneNumberValid(value);
                                        });
                                      },
                                      validator: (value) {
                                        final text = value;
                                        if (text == null ||
                                            text.isEmpty ||
                                            text.length < 10) {
                                          return '10~11자 이내의 숫자';
                                        }

                                        if (text.isNotEmpty &&
                                            !TextUtils.isPhoneNumberValid(text)) {
                                          return '10~11자 이내로 제대로된 전화번호를 입력해 주세요.';
                                        }

                                        return null;
                                      },
                                      maxLength: 11,
                                      inputFormatters: [
                                        // 숫자만 자판만 허용(한글, 영어, 이모티콘 다 안됨)
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'),
                                        ),
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                          onTap: () => _phoneController.clear(),
                                          child: Icon(
                                            Icons.cancel,
                                            color: ColorsConstants.boldColor,
                                            size: 20,
                                          ),
                                        ),
                                        helperText: "10~11자 이내의 숫자",
                                        helperStyle: TextStyle(
                                          color: ColorsConstants.strokeColor,
                                        ),
                                        prefixIcon: Icon(Icons.phone_enabled),
                                        prefixIconColor:
                                            ColorsConstants.strokeColor,
                                        iconColor: ColorsConstants.strokeColor,
                                        hintText: '예약자 휴대폰 번호를 입력해주세요.',
                                        hintStyle: TextStyle(
                                          color: ColorsConstants.textHint,
                                          fontSize: 15,
                                        ),
                                        labelText: '예약자 휴대폰 번호',
                                        labelStyle: TextStyle(
                                          color: ColorsConstants.strokeColor,
                                          fontSize: 14,
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: ColorsConstants.primary,
                                            width: 1,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: ColorsConstants.primary,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: ColorsConstants
                                                .primaryButtonBackgroundDisabled,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: ColorsConstants.strokeColor,
                                            width: 1,
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 10),
                                      ),
                                      style: TextStyle(
                                        color: ColorsConstants.boldColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        if (!_nameKey.currentState!.validate() ||
                                            !_phoneNumberKey.currentState!
                                                .validate()) {
                                          if (!_nameKey.currentState!
                                              .validate()) {
                                            _onFocusOutInput(1);
                                            _onFocusInput(context, 0);
                                            return;
                                          }

                                          if (!_phoneNumberKey.currentState!
                                              .validate()) {
                                            _onFocusOutInput(0);
                                            _onFocusInput(context, 1);
                                            return;
                                          }
                                        }

                                        _stopTimer();

                                        reservationFourthBloc.add(
                                          ReservationFourthRequestPhoneAuthNumber(
                                            name: _nameController.text,
                                            phoneNumber: _phoneController.text,
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                          BorderSide(
                                            color: _isNameValidate &&
                                                    _isPhoneNumberValidate
                                                ? ColorsConstants.strokeColor
                                                : ColorsConstants.primary,
                                          ),
                                        ), // 테두리 선 색상
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                          _isNameValidate &&
                                                  _isPhoneNumberValidate
                                              ? ColorsConstants.strokeColor
                                              : ColorsConstants.primary,
                                        ), // 텍스트 색상
                                      ),
                                      child: Text(
                                        '인증번호\n전송',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 30.0),
                      ),
                      BlocBuilder<ReservationFourthBloc, ReservationFourthState>(
                        bloc: reservationFourthBloc,
                        builder: (context, state) {
                          final slideAnimation = Tween<Offset>(
                            begin: Offset(1.0, 0.0),
                            end: Offset(0.0, 0.0),
                          ).animate(CurvedAnimation(
                            parent: _authCodeAnimationController,
                            curve: Curves.easeInOut,
                          ));

                          return AnimatedBuilder(
                              animation: _authCodeAnimationController,
                              builder: (context, child) {
                                return Visibility(
                                  visible: state.isRequestSuccess,
                                  child: SlideTransition(
                                    position: slideAnimation,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: TextFormField(
                                            key: _authPhoneNumberKey,
                                            controller: _authNumberController,
                                            focusNode: _focusNodes[2],
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            onChanged: (value) {
                                              setState(() {
                                                _isAuthCodeValidate =
                                                    value.isNotEmpty &&
                                                        value.length > 5;
                                              });
                                            },
                                            validator: (value) {
                                              if (_durationInSeconds == 0) {
                                                return '인증번호를 재발급 받으세요..!';
                                              }

                                              final text = value;
                                              if (text == null ||
                                                  text.isEmpty ||
                                                  text.length < 6) {
                                                return '6자리 숫자 인증번호 입력';
                                              }

                                              return null;
                                            },
                                            maxLength: 6,
                                            inputFormatters: [
                                              // 숫자만 자판만 허용(한글, 영어, 이모티콘 다 안됨)
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(r'[0-9]')),
                                            ],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              suffixIcon: InkWell(
                                                onTap: () =>
                                                    _authNumberController.clear(),
                                                child: Icon(
                                                  Icons.cancel,
                                                  color:
                                                      ColorsConstants.boldColor,
                                                  size: 20,
                                                ),
                                              ),
                                              helperText: "인증 버튼을 눌러주세요!",
                                              helperStyle: TextStyle(
                                                color:
                                                    ColorsConstants.strokeColor,
                                              ),
                                              prefix: _timer != null
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: Text(
                                                        DateTimeUtils
                                                            .formatDuration(
                                                          _durationInSeconds,
                                                        ),
                                                        style: TextStyle(
                                                          color: ColorsConstants
                                                              .strokeColor,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    )
                                                  : null,
                                              iconColor:
                                                  ColorsConstants.strokeColor,
                                              label: Text(
                                                '인증번호',
                                                style: TextStyle(
                                                  color:
                                                      ColorsConstants.strokeColor,
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: ColorsConstants.primary,
                                                  width: 1,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: ColorsConstants.primary,
                                                  width: 1,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color: ColorsConstants
                                                      .primaryButtonBackgroundDisabled,
                                                  width: 1,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                  color:
                                                      ColorsConstants.strokeColor,
                                                  width: 1,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.all(10),
                                            ),
                                            style: TextStyle(
                                              color: ColorsConstants.boldColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            width: 10,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: OutlinedButton(
                                            onPressed: () {
                                              if (!state.isRequestSuccess) {
                                                SnackBarUtils.showCustomSnackBar(
                                                  context,
                                                  "인증 번호를 발급받아 주세요.",
                                                );
                                              }

                                              if (!_authPhoneNumberKey
                                                  .currentState!
                                                  .validate()) {
                                                _onFocusInput(context, 2);
                                                return;
                                              }

                                              reservationFourthBloc.add(
                                                ReservationFourthRequestPhoneAuthCheck(
                                                  authCode:
                                                      _authNumberController.text,
                                                ),
                                              );
                                            },
                                            style: ButtonStyle(
                                              side: MaterialStateProperty.all(
                                                BorderSide(
                                                  color:
                                                      _durationInSeconds != 0 &&
                                                              _isAuthCodeValidate
                                                          ? ColorsConstants
                                                              .strokeColor
                                                          : ColorsConstants
                                                              .primary,
                                                ),
                                              ),
                                              // 테두리 선 색상
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                _durationInSeconds != 0 &&
                                                        _isAuthCodeValidate
                                                    ? ColorsConstants.strokeColor
                                                    : ColorsConstants.primary,
                                              ), // 텍스트 색상
                                            ),
                                            child: Text(
                                              '인증',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                      BlocBuilder<ReservationFourthBloc, ReservationFourthState>(
                        bloc: reservationFourthBloc,
                        builder: (context, state) {
                          if (state.isRequestSuccess && state.isCheckSuccess) {
                            return Column(
                              children: [
                                Container(
                                  constraints: const BoxConstraints.expand(
                                    height: 40,
                                  ),
                                ),
                                AnimatedTextKit(
                                  repeatForever: false,
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    WavyAnimatedText(
                                      "본인 인증에 성공하였습니다.",
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: ColorsConstants.strokeColor,
                                      ),
                                      speed: const Duration(milliseconds: 200),
                                    ),
                                    WavyAnimatedText(
                                      "아래의 버튼을 클릭하면 예약이 완료됩니다!",
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: ColorsConstants.strokeColor,
                                      ),
                                      speed: const Duration(milliseconds: 200),
                                    ),
                                  ],
                                  onTap: () {
                                    debugPrint("Tap Event");
                                  },
                                ),
                              ],
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
