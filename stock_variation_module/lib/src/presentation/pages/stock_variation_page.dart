import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/stock_variation_controller.dart';

import '../widgets/chart_widget.dart';
import '../widgets/info_stock_list_widget.dart';
import '../widgets/search_stock_widget.dart';

class StockVariationPage extends StatefulWidget {
  const StockVariationPage({super.key});

  @override
  State<StockVariationPage> createState() => _StockVariationPageState();
}

class _StockVariationPageState extends State<StockVariationPage> {
  late final StockVariationController controller;

  @override
  void initState() {
    controller = context.read<StockVariationController>();
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StockVariationController>(
        builder: (context, controller, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: controller.containesStock == true
                ? Text(controller.stockVariationVO.symbol ?? "-")
                : null,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SearchStockWidget(),
                  SizedBox(height: 16),
                  ChartWidget(),
                  SizedBox(height: 16),
                  InfoStockListWidget(),
                  SeeMoreWidget()
                ],
              ),
            ),
          ));
    });
  }
}

class SeeMoreWidget extends StatelessWidget {
  const SeeMoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StockVariationController>(
        builder: (context, controller, child) {
      return controller.containesStock == true
          ? GestureDetector(
              onTap: () => controller.navigateGoToExpanded(context: context),
              child: const Text(
                'Ver mais',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : const SizedBox.shrink();
    });
  }
}
