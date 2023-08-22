import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/bloc/reservation_check_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/model/menu_item_model.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/widget/expand/expand_menu_widget.dart';

class ExpandFilterWidget extends StatefulWidget {
  const ExpandFilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpandFilterWidget> createState() => _ExpandFilterWidgetState();
}

class _ExpandFilterWidgetState extends State<ExpandFilterWidget> {
  late final ReservationCheckBloc _reservationCheckBloc;
  late final CustomPopupMenuController _popupController;

  @override
  void initState() {
    super.initState();
    _reservationCheckBloc = BlocProvider.of<ReservationCheckBloc>(context);
    _popupController = CustomPopupMenuController();
  }

  @override
  void dispose() {
    _popupController.dispose();
    super.dispose();
  }

  List<MenuItemModel> _checkMenuList(ReservationFilterType filterType) {
    return Constants.checkFilterMenuList.map((item) {
      return item.copyWith(isChecked: item.filterType == filterType);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ReservationCheckBloc, ReservationCheckState,
        ReservationFilterType>(
      bloc: _reservationCheckBloc,
      selector: (state) {
        return state.reservationFilterType;
      },
      builder: (context, state) {
        return CustomPopupMenu(
          controller: _popupController,
          menuBuilder: () => ExpandMenuWidget(
            menuList: _checkMenuList(state),
            onFilterChange: (filterType) {
              if (filterType == state) {
                _popupController.hideMenu();
                return;
              }

              _reservationCheckBloc.add(
                ReservationCheckChangeFilterEvent(
                  filterType: filterType,
                ),
              );
              _popupController.hideMenu();
            },
          ),
          pressType: PressType.singleClick,
          child: Row(
            children: [
              Icon(
                Icons.arrow_drop_down,
                color: ColorsConstants.strokeColor,
              ),
              Text(
                state == ReservationFilterType.all
                    ? "전체"
                    : state == ReservationFilterType.nonAuth
                        ? "비인증"
                        : state == ReservationFilterType.auth
                            ? "인증"
                            : "전체",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorsConstants.strokeColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
