import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/stock_variation_controller.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StockVariationController>(
        builder: (context, controller, child) {
      return controller.containesStock == true
          ? SizedBox(
              width: double.infinity,
              height: 200,
              child: Sparkline(
                data: controller.stockVariationVO.listDataChartSparkline ?? [],
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[800]!, Colors.transparent],
                ),
                lineColor: Colors.blue[800]!,
                lineWidth: 2.0,
              ),
            )
          : const Center(
              child: Text('Nenhum ativo encontrado'),
            );
    });
  }
}
