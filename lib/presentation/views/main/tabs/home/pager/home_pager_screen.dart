import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:reservation_app/presentation/utils/constants.dart';
import 'package:reservation_app/presentation/views/main/block/main_bloc.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/home/content_home_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/location/content_location_tab_screen.dart';
import 'package:reservation_app/presentation/views/main/tabs/home/tabs/notice/content_notice_tab_screen.dart';

class HomePagerScreen extends StatefulWidget {
  const HomePagerScreen({Key? key}) : super(key: key);

  @override
  State<HomePagerScreen> createState() => _HomePagerScreenState();
}

class _HomePagerScreenState extends State<HomePagerScreen>
    with TickerProviderStateMixin {
  late final TabController _controller;

  late final AnimationController _animationControllerOn;
  late final AnimationController _animationControllerOff;

  late final Animation _colorTweenBackgroundOn;
  late final Animation _colorTweenBackgroundOff;

  late final Animation _colorTweenForegroundOn;
  late final Animation _colorTweenForegroundOff;

  int _currentIndex = 0;

  int _prevControllerIndex = 0;

  double _aniValue = 0.0;

  double _prevAniValue = 0.0;

  final Color _foregroundOn = Colors.white;
  final Color _foregroundOff = Colors.black;

  final Color _backgroundOn = ColorsConstants.tabBarSubBackground;
  final Color _backgroundOff = Colors.white;

  final ScrollController _scrollController = ScrollController();

  final List _keys = [];

  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();

    for (int index = 0; index < Constants.homeTabCategoryList.length; index++) {
      _keys.add(GlobalKey());
    }

    _controller = TabController(vsync: this, length: Constants.homeTabCategoryList.length);
    _controller.animation?.addListener(_handleTabAnimation);
    _controller.addListener(_handleTabChange);

    _animationControllerOff = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 75),
    );
    _animationControllerOff.value = 1.0;

    _colorTweenBackgroundOff = ColorTween(
      begin: _backgroundOn,
      end: _backgroundOff,
    ).animate(_animationControllerOff);
    _colorTweenForegroundOff = ColorTween(
      begin: _foregroundOn,
      end: _foregroundOff,
    ).animate(_animationControllerOff);

    _animationControllerOn = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _animationControllerOn.value = 1.0;

    _colorTweenBackgroundOn = ColorTween(
      begin: _backgroundOff,
      end: _backgroundOn,
    ).animate(_animationControllerOn);
    _colorTweenForegroundOn = ColorTween(
      begin: _foregroundOff,
      end: _foregroundOn,
    ).animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _animationControllerOn.dispose();
    _animationControllerOff.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainBlock = BlocProvider.of<MainBloc>(context)
      ..add(
        HomeTabLayoutCurrentPositionEvent(
          _currentIndex,
        ),
      );

    return Container(
      decoration: BoxDecoration(
        color: ColorsConstants.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsConstants.divider,
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 45.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: Constants.homeTabCategoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  key: _keys[index],
                  padding: EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: ButtonTheme(
                    child: AnimatedBuilder(
                      animation: _colorTweenBackgroundOn,
                      builder: (context, child) => TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          backgroundColor: _getBackgroundColor(index),
                        ),
                        onPressed: () {
                          setState(() {
                            _buttonTap = true;
                            _controller.animateTo(index);
                            _setCurrentIndex(index);
                            _scrollTo(index);
                          });
                        },
                        child: Text(
                          Constants.homeTabCategoryList[index],
                          style: TextStyle(
                            color: _getForegroundColor(index),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                ContentHomeTabScreen(), // 홈
                Center(child: Text("예약")),
                ContentNoticeTabScreen(), // 공지사항
                Center(child: Text("알림")),
                ContentLocationTabScreen(), // 오시는 길
              ],
            ),
          ),
        ],
      ),
    );
  }

  _handleTabAnimation() {
    _aniValue = _controller.animation!.value;

    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      _setCurrentIndex(_aniValue.round());
    }

    _prevAniValue = _aniValue;
  }

  _handleTabChange() {
    if (_buttonTap) _setCurrentIndex(_controller.index);

    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;

    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });

      _triggerAnimation();
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    double screenWidth = MediaQuery.of(context).size.width;

    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    double size = renderBox.size.width;
    double position = renderBox.localToGlobal(Offset.zero).dx;

    double offset = (position + size / 2) - screenWidth / 2;

    if (offset < 0) {
      renderBox = _keys[0].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;

      if (position > offset) offset = position;
    } else {
      renderBox = _keys[Constants.homeTabCategoryList.length - 1].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;
      size = renderBox.size.width;

      if (position + size < screenWidth) screenWidth = position + size;

      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    _scrollController.animateTo(
      offset + _scrollController.offset,
      duration: Duration(milliseconds: 150),
      curve: Curves.easeInOut,
    );
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenBackgroundOff.value;
    } else {
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }
}
