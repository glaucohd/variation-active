import '../../domain/entities/stock_entity.dart';
import '../../utils/util.dart';
import 'indicators_model.dart';
import 'meta_model.dart';

class StockModel extends StockEntity {
  StockModel(
      {List<int>? timestamp, IndicatorsModel? indicators, MetaModel? meta})
      : super(
          timestamp: timestamp,
          indicators: indicators,
          meta: meta,
        );

  factory StockModel.fromJson(dynamic json) {
    return StockModel(
        meta: MetaModel.fromJson(Util.getMapJson(json['meta'])),
        indicators:
            IndicatorsModel.fromJson(Util.getMapJson(json['indicators'])),
        timestamp: json['timestamp'].cast<int>());
  }
}
