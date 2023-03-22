import '../../domain/entities/meta_entity.dart';
import '../../utils/util.dart';

class MetaModel extends MetaEntity {
  MetaModel({String? symbol})
      : super(
          symbol: symbol,
        );
  factory MetaModel.fromJson(dynamic json) {
    return MetaModel(symbol: Util.stringJson(json['symbol']));
  }
}
