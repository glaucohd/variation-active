import 'package:stock_variation_module/src/infra/models/stock_model.dart';

import '../../domain/entities/stock_variation_entity.dart';
import '../../utils/util.dart';

class StockVariationModel extends StockVariationEntity {
  StockVariationModel({
    List<StockModel>? liststock,
  }) : super(
          liststock: liststock,
        );

  factory StockVariationModel.fromJson(dynamic json) {
    return StockVariationModel(
        liststock: Util.listJson(json['result'])
            .map((element) => StockModel.fromJson(Util.getMapJson(element)))
            .toList());
  }
}
