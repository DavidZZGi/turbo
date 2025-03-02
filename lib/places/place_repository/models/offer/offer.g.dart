// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'offerTitle': instance.offerTitle,
      'offerDescription': instance.offerDescription,
      'offerValidUntil': instance.offerValidUntil.toIso8601String(),
      'offerPrice': instance.offerPrice,
      'offerConditions': instance.offerConditions,
      'offerImage': instance.offerImage,
    };

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
      offerTitle: json['offerTitle'] as String,
      offerDescription: json['offerDescription'] as String,
      offerValidUntil: DateTime.parse(json['offerValidUntil'] as String),
      offerPrice: (json['offerPrice'] as num?)?.toDouble(),
      offerConditions: json['offerConditions'] as String?,
      offerImage: json['offerImage'] as String?,
    );

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'offerTitle': instance.offerTitle,
      'offerDescription': instance.offerDescription,
      'offerValidUntil': instance.offerValidUntil.toIso8601String(),
      'offerPrice': instance.offerPrice,
      'offerConditions': instance.offerConditions,
      'offerImage': instance.offerImage,
    };
