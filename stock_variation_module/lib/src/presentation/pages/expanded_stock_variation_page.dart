import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/stock_variation_controller.dart';
import '../widgets/info_stock_list_widget.dart';

class ExpandedStockVariationPage extends StatelessWidget {
  const ExpandedStockVariationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StockVariationController>(
        builder: (context, controller, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(controller.stockVariationVO.symbol ?? "-"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
          child: InfoStockListWidget(
            limit: controller.stockVariationVO.listOpen!.length < 30
                ? controller.stockVariationVO.listOpen?.length
                : 29,
            shrinkWrap: false,
          ),
        ),
      );
    });
  }
}
