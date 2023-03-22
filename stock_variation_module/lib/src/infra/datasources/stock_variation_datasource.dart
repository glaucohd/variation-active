import '../models/stock_variation_model.dart';

abstract class StockVariationDatasource {
  Future<StockVariationModel> getStockVariationV8({String? stock});
}
