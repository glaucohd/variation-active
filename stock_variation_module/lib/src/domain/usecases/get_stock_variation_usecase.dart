import '../entities/stock_variation_entity.dart';

abstract class GetStockVariationUseCase {
  Future<StockVariationEntity> call({String? stock});
}
