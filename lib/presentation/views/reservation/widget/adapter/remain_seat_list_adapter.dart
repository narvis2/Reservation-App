import 'package:flutter/material.dart';
import 'package:reservation_app/domain/model/reservation/reservation_target_part_time_seat_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

class RemainSeatListAdapter extends StatefulWidget {
  final List<ReservationTargetPartTimeSeatModel> seatList;
  final void Function({
    required int selectedItem,
  }) onSelectedSeat;

  const RemainSeatListAdapter({
    Key? key,
    required this.seatList,
    required this.onSelectedSeat,
  }) : super(key: key);

  @override
  State<RemainSeatListAdapter> createState() => _RemainSeatListAdapterState();
}

class _RemainSeatListAdapterState extends State<RemainSeatListAdapter> {
  List<ReservationTargetPartTimeSeatModel> _updatedSeatList = [];

  @override
  void initState() {
    super.initState();
    _updatedSeatList = List.from(widget.seatList);
  }

  @override
  void didUpdateWidget(RemainSeatListAdapter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_updatedSeatList != oldWidget.seatList) {
      setState(() {
        _updatedSeatList = List.from(widget.seatList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 50,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _updatedSeatList.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              widget.onSelectedSeat(selectedItem: index);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _updatedSeatList[index].isSelected
                    ? ColorsConstants.strokeColor
                    : ColorsConstants.primaryButtonBackgroundDisabled, // 동그라미의 배경색 지정
              ),
              child: Center(
                child: Text(
                  _updatedSeatList[index].remainSeatList.name,
                  style: TextStyle(
                    color: ColorsConstants.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
