import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant.freezed.dart';
part 'plant.g.dart';

@freezed
abstract class Plant with _$Plant {
  const factory Plant({
    required String imageUrl,
    required String name,
    required double price,
    @Default(false) bool bookmarked,
  }) = _Plant;

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
}
