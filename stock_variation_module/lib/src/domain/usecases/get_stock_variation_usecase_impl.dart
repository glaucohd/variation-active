import '../entities/stock_variation_entity.dart';
import '../repositories/stock_variation_repository.dart';
import 'get_stock_variation_usecase.dart';

class GetStockVariationUseCaseImpl extends GetStockVariationUseCase {
  final StockVariationRepository repository;
  GetStockVariationUseCaseImpl({
    required this.repository,
  });
  @override
  Future<StockVariationEntity> call({String? stock}) async {
    return repository.getStockVariation(stock: stock);
  }
}
