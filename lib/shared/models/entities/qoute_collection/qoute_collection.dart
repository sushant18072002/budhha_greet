import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'quote/quote.dart';
export 'quote/quote.dart';

part 'qoute_collection.g.dart';

@HiveType(typeId: 77)
@JsonSerializable()
class QuoteCollection {
  @HiveField(0)
   @JsonKey(name: 'data')
  final List<Quote> data;

  QuoteCollection({
    required this.data,
  });

  factory QuoteCollection.fromJson(Map<String, dynamic> json) => 
    _$QuoteCollectionFromJson(json);
  
  Map<String, dynamic> toJson() => _$QuoteCollectionToJson(this);
}