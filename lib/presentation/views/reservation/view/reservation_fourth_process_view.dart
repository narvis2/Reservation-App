import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/text_utils.dart';
import 'package:reservation_app/presentation/views/reservation/bloc/fourth/reservation_fourth_bloc.dart';

class ReservationFourthProcessView extends StatefulWidget {
  const ReservationFourthProcessView({Key? key}) : super(key: key);

  @override
  State<ReservationFourthProcessView> createState() =>
      _ReservationFourthProcessViewState();
}

class _ReservationFourthProcessViewState
    extends State<ReservationFourthProcessView> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reservationFourthBloc = context.read<ReservationFourthBloc>();

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 30.0,
          right: 30.0,
          bottom: 20.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const Key('nameTextField'),
                controller: nameController,
                autovalidateMode: AutovalidateMode.always,
                textInputAction: TextInputAction.done,
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
                    onTap: () => nameController.clear(),
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
                      color: ColorsConstants.primaryButtonBackgroundDisabled,
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
              Container(constraints: const BoxConstraints.expand(height: 25.0)),
              TextFormField(
                key: const Key('phoneNumberTextField'),
                controller: phoneController,
                maxLength: 11,
                inputFormatters: [
                  // 숫자만 자판만 허용(한글, 영어, 이모티콘 다 안됨)
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  helperText: "10~11자 이내의 숫자",
                  helperStyle: TextStyle(
                    color: ColorsConstants.guideText,
                  ),
                  prefixIcon: Icon(Icons.phone_enabled),
                  prefixIconColor: ColorsConstants.strokeColor,
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
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: ColorsConstants.primaryButtonBackgroundDisabled,
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
            ],
          ),
        ),
      ),
    );
  }
}
