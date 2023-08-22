import 'package:flutter/material.dart';
import 'package:reservation_app/domain/model/reservation/enum/reservation_filter_type.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/views/main/tabs/search/check/model/menu_item_model.dart';

class ExpandMenuWidget extends StatelessWidget {
  final List<MenuItemModel> menuList;
  final void Function(ReservationFilterType filterType) onFilterChange;

  const ExpandMenuWidget({
    Key? key,
    required this.menuList,
    required this.onFilterChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 110,
        height: 120,
        color: Colors.black,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: menuList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 110,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  onFilterChange(menuList[index].filterType);
                },
                child: Row(
                  children: <Widget>[
                    menuList[index].isChecked ? Icon(
                      Icons.check,
                      size: 20,
                      color: Colors.white,
                    ) : SizedBox(width: 20, height: 20,),

                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        menuList[index].filterType == ReservationFilterType.all
                            ? "전체 예약"
                            : menuList[index].filterType == ReservationFilterType.nonAuth
                            ? "비인증 예약"
                            : menuList[index].filterType == ReservationFilterType.auth
                            ? "인증 예약"
                            : "전체 예약",
                        style: TextStyle(
                          color: ColorsConstants.background,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
