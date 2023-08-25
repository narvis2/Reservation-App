import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class ReservationCheckDetailButton extends StatelessWidget {
  final bool isAuth;
  final void Function() onRemoveClick;
  final void Function() onApprovalClick;

  const ReservationCheckDetailButton({
    Key? key,
    required this.isAuth,
    required this.onRemoveClick,
    required this.onApprovalClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onRemoveClick,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(50),
                  ),
                ),
                backgroundColor:
                MaterialStateProperty.all<Color>(
                  ColorsConstants.primary,
                ),
              ),
              child: Text(
                "삭제",
                style: TextStyle(
                  color: ColorsConstants.background,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isAuth,
            child: SizedBox(width: 10),
          ),
          Visibility(
            visible: !isAuth,
            child: Expanded(
              child: ElevatedButton(
                onPressed: onApprovalClick,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(50),
                    ),
                  ),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(
                    ColorsConstants.strokeColor,
                  ),
                ),
                child: Text(
                  "승인",
                  style: TextStyle(
                    color: ColorsConstants.background,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
