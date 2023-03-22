import '../../domain/entities/stock_variation_entity.dart';
import '../../domain/repositories/stock_variation_repository.dart';
import '../datasources/stock_variation_datasource.dart';

class StockVariationRepositoryImpl extends StockVariationRepository {
  final StockVariationDatasource datasource;
  StockVariationRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<StockVariationEntity> getStockVariation({String? stock}) async {
    return datasource.getStockVariationV8(stock: stock);
  }
}
