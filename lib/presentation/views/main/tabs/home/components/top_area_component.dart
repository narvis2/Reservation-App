import 'package:flutter/material.dart';

import '../../../../../utils/color_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagesList = [
  'http://127.0.0.1:8080/image/8e18e30e-519f-41b4-8b42-aba48b0c1def.JPG',
  'http://127.0.0.1:8080/image/d34db6cc-9ebc-407e-b7aa-1ebef7b2d148.JPG',
  'http://127.0.0.1:8080/image/deadbbca-36cc-470a-a4f5-c0175c654a62.JPG',
];

class TopAreaComponent extends StatefulWidget {
  final double maxHeight;

  TopAreaComponent({Key? key, required this.maxHeight}) : super(key: key);

  @override
  State<TopAreaComponent> createState() => _TopAreaComponentState();
}

class _TopAreaComponentState extends State<TopAreaComponent> {
  late double backgroundHeight;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    backgroundHeight = widget.maxHeight * 0.45;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: backgroundHeight,
      color: ColorsConstants.background,
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              // enlargeCenterPage: true,
              //scrollDirection: Axis.vertical,
              onPageChanged: (index, reason) {
                setState(
                      () {
                    currentIndex = index;
                  },
                );
              },
            ),
            items: imagesList
                .map(
                  (item) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  elevation: 6.0,
                  shadowColor: ColorsConstants.divider,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map((urlOfItem) {
              int index = imagesList.indexOf(urlOfItem);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index
                      ? Color.fromRGBO(0, 0, 0, 0.8)
                      : Color.fromRGBO(0, 0, 0, 0.3),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}