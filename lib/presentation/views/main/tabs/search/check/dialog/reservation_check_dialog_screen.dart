import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/config/router/app_router.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/dialog/widget/check_dialog_confirm_button_widget.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/dialog/widget/check_dialog_input_widget.dart';

class ReservationCheckDialogScreen extends StatefulWidget {
  final BuildContext buildContext;

  const ReservationCheckDialogScreen({
    Key? key,
    required this.buildContext,
  }) : super(key: key);

  @override
  State<ReservationCheckDialogScreen> createState() =>
      _ReservationCheckDialogScreenState();
}

class _ReservationCheckDialogScreenState
    extends State<ReservationCheckDialogScreen> {
  final _formKey = GlobalKey<FormState>();
  final _inputKey = GlobalKey<FormFieldState>();

  final TextEditingController _inputController = TextEditingController();
  final _focusNode = FocusNode();

  bool _isInputValidate = false;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _onFocusInput(widget.buildContext);
    }
  }

  @override
  void dispose() {
    _inputController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool _isFocusInput() {
    return _focusNode.hasFocus;
  }

  void _onFocusOutInput() {
    if (_isFocusInput()) {
      _focusNode.unfocus();
    }
  }

  void _onFocusInput(BuildContext context) {
    if (!_isFocusInput()) {
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.dialogBackground,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Stack(children: [
              Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: ColorsConstants.background,
                  borderRadius: BorderRadius.circular(
                    20,
                  ), // 여기에 반지름 값을 설정합니다
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 42,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorsConstants.boldColor,
                              letterSpacing: -0.03,
                            ),
                            child: Text('예약 번호'),
                          ),
                        ),
                      ),
                      Divider(
                        color: ColorsConstants.boldColor,
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(height: 20.0),
                      ),
                      CheckDialogInputWidget(
                        inputKey: _inputKey,
                        textController: _inputController,
                        helperText: "안내받은 예약 번호를 입력해주세요.",
                        hintText: '예약 번호를 입력해주세요.',
                        labelText: "예약 번호",
                        focusNode: _focusNode,
                        inputFormatters: [],
                        onSubmitted: (value) {
                          _onFocusOutInput();
                        },
                        onChange: (value) {
                          setState(() {
                            _isInputValidate = value.isNotEmpty;
                          });
                        },
                        onValidChange: (value) {
                          final text = value;
                          if (text != null && text.isEmpty) {
                            return "안내받은 예약 번호를 입력해주세요.";
                          }

                          return null;
                        },
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(
                          height: 30.0,
                        ),
                      ),
                      CheckDialogConfirmButtonWidget(
                        title: "확인",
                        isValid: _isInputValidate,
                        onClickSignIn: () {
                          if (!_isInputValidate) {
                            _onFocusInput(context);
                            return;
                          }

                          Navigator.of(widget.buildContext).pop();

                          AutoRouter.of(context).push(
                            ReservationCheckTabDetailsRoute(
                              certificationNumber: _inputController.text,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -5,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 35,
                  ),
                  color: ColorsConstants.background,
                  onPressed: () {
                    Navigator.of(widget.buildContext).pop();
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
