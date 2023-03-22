// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'indicators_entity.dart';
import 'meta_entity.dart';

class StockEntity {
  List<int>? timestamp;
  IndicatorsEntity? indicators;
  MetaEntity? meta;

  StockEntity({
    this.timestamp,
    this.indicators,
    this.meta,
  });
}
