import 'dart:convert';

import 'package:http/http.dart';

import '../../infra/datasources/stock_variation_datasource.dart';
import '../../infra/models/stock_variation_model.dart';

class StockVariationDatasourceImpl implements StockVariationDatasource {
  final Client client;
  StockVariationDatasourceImpl({
    required this.client,
  });

  @override
  Future<StockVariationModel> getStockVariationV8({String? stock}) async {
    StockVariationModel result = StockVariationModel();
    var uri = 'https://query2.finance.yahoo.com/v8/finance/chart/$stock.SA';

    try {
      final response = await client.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        final decode = json.decode(response.body);
        final jsonData = decode['chart'];
        result = StockVariationModel.fromJson(jsonData);

        return result;
      }
    } catch (e) {
      rethrow;
    }

    return result;
  }
}
