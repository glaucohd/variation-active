import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../controllers/stock_variation_controller.dart';

class SectionStockWidget extends StatelessWidget {
  final StockVariationController controller;
  final int index;
  const SectionStockWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue[100],
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                Constants.value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(controller.formattedPrice(
                      priceOpen:
                          controller.stockVariationVO.listOpen?[index]) ??
                  "-"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Text(
                Constants.dayVariation,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(controller.stockVariationVO.listDayVariation?[index] ?? "-"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Text(Constants.variationFromTheFirstDate,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const Spacer(),
              Text(controller
                      .stockVariationVO.listVariationFromTheFirstDate?[index] ??
                  "-"),
            ],
          ),
        ],
      ),
    );
  }
}
