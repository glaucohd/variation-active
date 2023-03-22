import '../entities/stock_variation_entity.dart';

abstract class StockVariationRepository {
  Future<StockVariationEntity> getStockVariation({String? stock});
}
