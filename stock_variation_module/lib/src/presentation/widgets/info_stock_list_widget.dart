import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/stock_variation_controller.dart';
import 'section_stock_widget.dart';

class InfoStockListWidget extends StatelessWidget {
  final int? limit;
  final bool? shrinkWrap;
  const InfoStockListWidget({
    super.key,
    this.limit = 3,
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StockVariationController>(
        builder: (context, controller, child) {
      return controller.containesStock == true
          ? ListView.builder(
              shrinkWrap: shrinkWrap ?? true,
              physics: shrinkWrap == true
                  ? const NeverScrollableScrollPhysics()
                  : null,
              itemCount: controller.stockVariationVO.listOpen
                      ?.take(limit ?? 3)
                      .length ??
                  0,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SectionStockWidget(
                          index: index,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : const SizedBox.shrink();
    });
  }
}
