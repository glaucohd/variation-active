import 'package:flutter/material.dart';
import 'src/app.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'src/domain/usecases/get_stock_variation_usecase_impl.dart';
import 'src/external/datasources/stock_variation_datasource_impl.dart';
import 'src/infra/repositories/stock_variation_repository_impl.dart';
import 'src/presentation/controllers/stock_variation_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StockVariationController(
            getStockVariationUseCase: GetStockVariationUseCaseImpl(
              repository: StockVariationRepositoryImpl(
                datasource: StockVariationDatasourceImpl(
                  client: http.Client(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
