import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class SignInSignUpInputWidget extends StatelessWidget {
  final TextEditingController textController;
  final String helperText;
  final String hintText;
  final String labelText;
  final IconData iconData;
  final void Function(String value) onSubmitted;
  final void Function(String value) onChange;
  final String? Function(String? value) onValidChange;

  SignInSignUpInputWidget({
    Key? key,
    required this.textController,
    required this.helperText,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.onSubmitted,
    required this.onChange,
    required this.onValidChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: textController,
        autovalidateMode: AutovalidateMode.always,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (value) {
          onSubmitted(value);
        },
        onChanged: onChange,
        validator: onValidChange,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () => textController.clear(),
            child: Icon(
              Icons.cancel,
              color: ColorsConstants.boldColor,
              size: 20,
            ),
          ),
          prefixIcon: Icon(iconData),
          prefixIconColor: ColorsConstants.strokeColor,
          helperText: helperText,
          helperStyle: TextStyle(
            color: ColorsConstants.strokeColor,
          ),
          iconColor: ColorsConstants.strokeColor,
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorsConstants.textHint,
            fontSize: 15,
          ),
          labelText: labelText,
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
    );
  }
}
