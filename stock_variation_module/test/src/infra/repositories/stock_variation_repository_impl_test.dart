import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_variation_module/src/infra/datasources/stock_variation_datasource.dart';
import 'package:stock_variation_module/src/infra/models/stock_variation_model.dart';
import 'package:stock_variation_module/src/infra/repositories/stock_variation_repository_impl.dart';

import 'stock_variation_repository_impl_test.mocks.dart';

@GenerateMocks([StockVariationDatasource])
void main() {
  final datasource = MockStockVariationDatasource();
  final repository = StockVariationRepositoryImpl(datasource: datasource);

  test('Deve Retornar um objeto do tipo StockVariationModel', () async {
    StockVariationModel stockVariationModel = StockVariationModel();
    when(datasource.getStockVariationV8())
        .thenAnswer((_) async => stockVariationModel);

    final result = await repository.getStockVariation();

    expect(result, isA<StockVariationModel>());
  });
}
