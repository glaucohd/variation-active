import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:stock_variation_module/src/domain/entities/stock_variation_entity.dart';
import 'package:stock_variation_module/src/domain/repositories/stock_variation_repository.dart';
import 'package:stock_variation_module/src/domain/usecases/get_stock_variation_usecase_impl.dart';
import 'get_stock_variation_usecase_impl_test.mocks.dart';

@GenerateMocks([StockVariationRepository])
void main() {
  final repository = MockStockVariationRepository();
  final usecase = GetStockVariationUseCaseImpl(repository: repository);

  test('Deve retornar um obejto do tipo StockVariationEntity', () async {
    // Arrange
    StockVariationEntity stockVariationEntity = StockVariationEntity();

    when(repository.getStockVariation())
        .thenAnswer((_) async => stockVariationEntity);

    final result = await usecase.call();
    expect(result, stockVariationEntity);
  });
}
