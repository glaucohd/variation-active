import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/stock_variation_controller.dart';

class SearchStockWidget extends StatelessWidget {
  const SearchStockWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StockVariationController>(
        builder: (context, controller, child) {
      return Row(
        children: [
          Expanded(
              child: TextField(
            controller: controller.textController,
            decoration: InputDecoration(
              hintText: 'Pesquisar por ativo',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.blue[800]!,
                ),
              ),
            ),
          )),
          const SizedBox(width: 8),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(5)),
            child: InkWell(
              onTap: () => controller.getStock(),
              child: const Icon(Icons.search),
            ),
          )
        ],
      );
    });
  }
}
