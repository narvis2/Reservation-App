import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

@RoutePage()
class ReservationCheckTabDetailsScreen extends StatelessWidget {
  final int id;
  final String title;

  const ReservationCheckTabDetailsScreen({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstants.background,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: ColorsConstants.splashText,
          ),
        ),
        leading: AutoLeadingButton(color: ColorsConstants.splashText),
        elevation: 3,
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "ReservationCheckTabDetailsScreen 👉 $id, $title",
          ),
        ),
      ),
    );
  }
}
