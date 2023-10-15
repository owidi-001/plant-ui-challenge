// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantImpl _$$PlantImplFromJson(Map<String, dynamic> json) => _$PlantImpl(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      bookmarked: json['bookmarked'] as bool? ?? false,
    );

Map<String, dynamic> _$$PlantImplToJson(_$PlantImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'price': instance.price,
      'bookmarked': instance.bookmarked,
    };
