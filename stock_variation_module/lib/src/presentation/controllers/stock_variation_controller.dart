import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/stock_variation_entity.dart';
import '../../domain/usecases/get_stock_variation_usecase.dart';
import '../pages/expanded_stock_variation_page.dart';
import '../vos/stock_variation_vo.dart';

class StockVariationController extends ChangeNotifier {
  final GetStockVariationUseCase getStockVariationUseCase;

  StockVariationVO stockVariationVO = StockVariationVO();
  TextEditingController textController = TextEditingController();
  bool containesStock = true;

  StockVariationController({required this.getStockVariationUseCase});

  Future<void> init() async {
    final result = await getStockVariationUseCase(stock: 'PETR4');

    fillVariationStockVO(result);

    notifyListeners();
  }

  void fillVariationStockVO(StockVariationEntity result) {
    stockVariationVO = StockVariationVO(
        symbol: result.liststock?[0].meta?.symbol
            ?.substring(0, result.liststock?[0].meta?.symbol?.indexOf('.')),
        listVariationFromTheFirstDate: variationFromTheFirstDate(
          listPrices: result.liststock?[0].indicators?.listQuote?[0].open,
        ),
        listDataChartSparkline: listDataChartSparkline(
          listPrices: result.liststock?[0].indicators?.listQuote?[0].open,
        ),
        listDayVariation: dayVariation(
          listPrices: result.liststock?[0].indicators?.listQuote?[0].open,
        ),
        listProfitability: profitability(
          listPrices: result.liststock?[0].indicators?.listQuote?[0].open,
        ),
        listOpen: result.liststock?[0].indicators?.listQuote?[0].open,
        listTimestampConverted: convertTimestamp(
          timestamp: result.liststock?[0].timestamp,
        ));
  }

  Future<void> getStock() async {
    final stock = textController.text;
    final result = await getStockVariationUseCase(stock: stock.toUpperCase());
    if (result.liststock != null) {
      containesStock = true;
      fillVariationStockVO(result);
      notifyListeners();
    } else {
      containesStock = false;
      notifyListeners();
    }
  }

  List<String>? convertTimestamp({List<int>? timestamp}) {
    List<String>? timestampConverted = <String>[];

    timestamp?.forEach((element) {
      DateTime dataUtc =
          DateTime.utc(1970, 1, 1).add(Duration(seconds: element));
      final date = DateFormat('dd/MM/yyyy').format(dataUtc);
      timestampConverted.add(date);
    });

    return timestampConverted;
  }

  String? formattedPrice({double? priceOpen}) {
    String? formattedPrice = "-";
    if (priceOpen != null) {
      formattedPrice =
          'R\$ ${priceOpen.toStringAsFixed(2).replaceAll('.', ',')}';
    }

    return formattedPrice;
  }

  List<String> variationFromTheFirstDate({List<double>? listPrices}) {
    List<String> listVariationFromTheFirstDate = <String>[];

    if (listPrices != null) {
      double firstPrice = listPrices.first;
      for (int i = 1;
          i < (listPrices.length < 30 ? listPrices.length : 30);
          i++) {
        double variation = ((listPrices[i] - firstPrice) / firstPrice) * 100;
        listVariationFromTheFirstDate.add('% ${variation.toStringAsFixed(2)}');
      }
    }

    return listVariationFromTheFirstDate;
  }

  //Variação em relaçào a D-1
  List<String>? dayVariation({List<double>? listPrices}) {
    List<String> listDayVariation = <String>[];
    if (listPrices != null) {
      for (int i = 1;
          i < (listPrices.length < 30 ? listPrices.length : 30);
          i++) {
        double variation =
            ((listPrices[i] - listPrices[i - 1]) / listPrices[i - 1]) * 100;

        listDayVariation.add('% ${variation.toStringAsFixed(2)}');
      }
    }
    return listDayVariation;
  }

  //RENTABILIDADE
  List<String>? profitability({List<double>? listPrices}) {
    List<String> listProfitability = <String>[];

    if (listPrices != null) {
      double initialPrice = listPrices[0];

      for (int i = 1;
          i < (listPrices.length < 30 ? listPrices.length : 30);
          i++) {
        double currentPrice = listPrices[i];
        double returnPercent =
            (currentPrice - initialPrice) / initialPrice * 100;
        listProfitability.add('% ${returnPercent.toStringAsFixed(2)}');
      }

      return listProfitability;
    }

    return listProfitability;
  }

  List<double>? listDataChartSparkline({List<double>? listPrices}) {
    List<double> listProfitability = <double>[];

    if (listPrices != null) {
      double initialPrice = listPrices[0];

      for (int i = 1;
          i < (listPrices.length < 30 ? listPrices.length : 30);
          i++) {
        double currentPrice = listPrices[i];
        double returnPercent =
            (currentPrice - initialPrice) / initialPrice * 100;
        listProfitability.add(returnPercent);
      }

      return listProfitability;
    }

    return listProfitability;
  }

  void navigateGoToExpanded({required BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ExpandedStockVariationPage()),
    );
  }
}
