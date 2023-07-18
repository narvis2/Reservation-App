import 'package:flutter/material.dart';
import 'package:reservation_app/domain/model/reservation/term/reservation_term_model.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/common/check_box_widget.dart';

class ReservationTermListAdapter extends StatefulWidget {
  final List<ReservationTermModel> termList;
  final void Function({
    required int selectedItem,
  }) onClickEvent;

  const ReservationTermListAdapter({
    Key? key,
    required this.termList,
    required this.onClickEvent,
  }) : super(key: key);

  @override
  State<ReservationTermListAdapter> createState() =>
      _ReservationTermListAdapterState();
}

class _ReservationTermListAdapterState
    extends State<ReservationTermListAdapter> {
  List<ReservationTermModel> _updateTermList = [];

  @override
  void initState() {
    super.initState();
    _updateTermList = List.from(widget.termList);
  }

  @override
  void didUpdateWidget(covariant ReservationTermListAdapter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_updateTermList != oldWidget.termList) {
      setState(() {
        _updateTermList = List.from(widget.termList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 108,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: ListView.builder(
        itemCount: _updateTermList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 36,
            child: Row(
              children: [
                CheckBoxWidget(
                  isChecked: _updateTermList[index].isChecked,
                  onClickEvent: () {
                    widget.onClickEvent(selectedItem: index);
                  },
                ),
                SizedBox(width: 12),
                Text(
                  _updateTermList[index].title,
                  style: TextStyle(
                    color: ColorsConstants.boldColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
