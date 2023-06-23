import 'package:flutter/material.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';

/// Android 의 TabLayout + ViewPager2 처럼 View를 좌우로
/// 스와이프했을 때 Tab 또한 같이 움직이게 하려고 만들었음
/// 위의 기능은 되는데 ListView.builder 가 width 의 Horizon 가운데에 정렬되지 않아
/// 일단 만들어만 놓고 추후 Flutter View 공부 후 수정 예정
class HomePagerScreen extends StatefulWidget {
  const HomePagerScreen({Key? key}) : super(key: key);

  @override
  State<HomePagerScreen> createState() => _HomePagerScreenState();
}

class _HomePagerScreenState extends State<HomePagerScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  late AnimationController _animationControllerOn;

  late AnimationController _animationControllerOff;

  late Animation _colorTweenBackgroundOn;
  late Animation _colorTweenBackgroundOff;

  late Animation _colorTweenForegroundOn;
  late Animation _colorTweenForegroundOff;

  int _currentIndex = 0;

  int _prevControllerIndex = 0;

  double _aniValue = 0.0;

  double _prevAniValue = 0.0;

  final List _icons = ["홈", "예약", "공지사항", "알림", "오시는길"];

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
    for (int index = 0; index < _icons.length; index++) {
      _keys.add(GlobalKey());
    }

    _controller = TabController(vsync: this, length: _icons.length);
    _controller.animation?.addListener(_handleTabAnimation);
    _controller.addListener(_handleTabChange);

    _animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          color: Colors.blue,
          width: double.infinity,
          height: 42.0,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: _icons.length,
              padding: EdgeInsets.symmetric(horizontal: 3),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    key: _keys[index],
                    padding:
                        EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 2),
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
                            _icons[index],
                            style: TextStyle(
                              color: _getForegroundColor(index),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    )));
              })),
      Flexible(
          child: TabBarView(
        controller: _controller,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10), child: Center(child: Text("홈"))),
          Center(child: Text("예약")),
          Center(child: Text("공지사항")),
          Center(child: Text("알림")),
          Center(child: Text("오시는길")),
        ],
      )),
    ]);
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
      renderBox = _keys[_icons.length - 1].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;
      size = renderBox.size.width;

      if (position + size < screenWidth) screenWidth = position + size;

      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    _scrollController.animateTo(offset + _scrollController.offset,
        duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
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