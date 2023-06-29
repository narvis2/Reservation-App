
import 'package:json_annotation/json_annotation.dart';

enum PartTime {
  @JsonValue('PART_A')
  partA,
  @JsonValue('PART_B')
  partB,
  @JsonValue('PART_C')
  partC
}