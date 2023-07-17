
import 'package:json_annotation/json_annotation.dart';

enum PartTime {
  @JsonValue('PART_A')
  partA,
  @JsonValue('PART_B')
  partB,
  @JsonValue('PART_C')
  partC
}

// Retrofit Query 에 Enum 을 넣기위한 대책
extension PartTimeExtension on PartTime {
  String toJson() {
    switch (this) {
      case PartTime.partA:
        return 'PART_A';
      case PartTime.partB:
        return 'PART_B';
      case PartTime.partC:
        return 'PART_C';
      default:
        throw ArgumentError('Invalid enum value: $this');
    }
  }
}