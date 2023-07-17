
import 'package:json_annotation/json_annotation.dart';

enum SeatType {
  @JsonValue('A_1')
  a1,
  @JsonValue('A_2')
  a2,
  @JsonValue('A_3')
  a3,
  @JsonValue('A_4')
  a4,
  @JsonValue('A_5')
  a5,
  @JsonValue('A_6')
  a6,
  @JsonValue('A_7')
  a7,
  @JsonValue('A_8')
  a8,
  @JsonValue('B')
  b,
  @JsonValue('C')
  c
}

extension SeatTypeExtension on SeatType {
  static SeatType fromJson(String json) {
    switch (json) {
      case 'A_1':
        return SeatType.a1;
      case 'A_2':
        return SeatType.a2;
      case 'A_3':
        return SeatType.a3;
      case 'A_4':
        return SeatType.a4;
      case 'A_5':
        return SeatType.a5;
      case 'A_6':
        return SeatType.a6;
      case 'A_7':
        return SeatType.a7;
      case 'A_8':
        return SeatType.a8;
      case 'B':
        return SeatType.b;
      case 'C':
        return SeatType.c;
      default:
        throw ArgumentError('Invalid JSON value for SeatType: $json');
    }
  }

  String toJson() {
    switch (this) {
      case SeatType.a1:
        return 'A_1';
      case SeatType.a2:
        return 'A_2';
      case SeatType.a3:
        return 'A_3';
      case SeatType.a4:
        return 'A_4';
      case SeatType.a5:
        return 'A_5';
      case SeatType.a6:
        return 'A_6';
      case SeatType.a7:
        return 'A_7';
      case SeatType.a8:
        return 'A_8';
      case SeatType.b:
        return 'B';
      case SeatType.c:
        return 'C';
    }
  }
}