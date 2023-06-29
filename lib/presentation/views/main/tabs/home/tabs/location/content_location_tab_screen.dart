import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:reservation_app/presentation/utils/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentLocationTabScreen extends StatefulWidget {
  const ContentLocationTabScreen({Key? key}) : super(key: key);

  @override
  State<ContentLocationTabScreen> createState() =>
      _ContentLocationTabScreenState();
}

class _ContentLocationTabScreenState extends State<ContentLocationTabScreen> {
  void _launchWebView(Uri uri) async {
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 10.0),
          ),
          Text(
            "우회담(한우 오마카세)",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: '대구 북구 동천로 126 3층, 우회담'));
            },
            icon: Icon(Icons.copy, size: 18),
            label: Text(
              "대구 북구 동천로 126 3층, 우회담",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ColorsConstants.divider,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 5.0),
          ),
          SizedBox(
            height: 250,
            child: NaverMap(
              forceGesture: true, // 스크롤 안에 Map 이 있는 경우 Scroll Event 겹침 대비
              onMapReady: (controller) {
                final marker = NMarker(
                  id: 'restaurant',
                  position: const NLatLng(35.9426627, 128.5610333),
                );
                marker.setOnTapListener(
                  (NMarker marker) {
                    final url = Uri.parse(
                        'https://map.naver.com/v5/entry/place/1568734621?lng=128.5610333&lat=35.9426627&placePath=%2Fhome%3Fentry=pll&c=15,0,0,0,dh');
                    _launchWebView(url);
                  },
                );

                controller.addOverlay(marker);

                final onMarkerInfoWindow = NInfoWindow.onMarker(
                  id: marker.info.id,
                  text: "우회담",
                );
                onMarkerInfoWindow.setOnTapListener(
                  (overlay) => {
                    _launchWebView(
                      Uri.parse(
                        'https://map.naver.com/v5/entry/place/1568734621?lng=128.5610333&lat=35.9426627&placePath=%2Fhome%3Fentry=pll&c=15,0,0,0,dh',
                      ),
                    )
                  },
                );

                marker.openInfoWindow(onMarkerInfoWindow);
              },
              options: NaverMapViewOptions(
                // 처음 보이는 좌표 세팅
                initialCameraPosition: const NCameraPosition(
                  target: NLatLng(35.9426627, 128.5610333),
                  zoom: 15,
                  bearing: 45,
                  tilt: 30,
                ),
                activeLayerGroups: [
                  NLayerGroup.building, // 빌딩
                  NLayerGroup.transit // 철도, 지하철 노선, 버스정류장
                ],
                minZoom: 10,
                maxZoom: 20,
                maxTilt: 30,
                // 지도 영역을 한반도 인근으로 제한
                extent: NLatLngBounds(
                  southWest: NLatLng(31.43, 122.37),
                  northEast: NLatLng(44.35, 132.0),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        '문의전화',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorsConstants.divider,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: TextButton.icon(
                        onPressed: () {
                          _makePhoneCall('01037931394');
                        },
                        icon: Icon(Icons.call, size: 18),
                        label: Text(
                          '010-3793-1394',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(
                        Text(
                          'Instagram',
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorsConstants.divider,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(
                        TextButton.icon(
                          onPressed: () {
                            // Clipboard.setData(
                            //   ClipboardData(text: 'uhoedam.offical'),
                            // );
                            final url = Uri.parse('https://www.instagram.com');
                            _launchWebView(url);
                          },
                          icon: Icon(Icons.link, size: 18),
                          label: Text(
                            'uhoedam.offical',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsConstants.divider,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            '이용시간',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsConstants.divider,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '13:00 ~ 20:00',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsConstants.divider,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            'Breaktime',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsConstants.divider,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '15:00 ~ 17:50',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsConstants.divider,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text(
                            '이용안내',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsConstants.divider,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '단체석, 주차가능, \n남/녀 화장실 구분, 무선 인터넷',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsConstants.divider,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
