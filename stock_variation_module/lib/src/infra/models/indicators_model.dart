import 'package:stock_variation_module/src/infra/models/quote_model.dart';

import '../../domain/entities/indicators_entity.dart';
import '../../utils/util.dart';

class IndicatorsModel extends IndicatorsEntity {
  IndicatorsModel({
    List<QuoteModel>? listQuote,
  }) : super(
          listQuote: listQuote,
        );

  factory IndicatorsModel.fromJson(dynamic json) {
    return IndicatorsModel(
        listQuote: Util.listJson(json['quote'])
            .map((element) => QuoteModel.fromJson(Util.getMapJson(element)))
            .toList());
  }
}
