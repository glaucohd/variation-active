// ignore_for_file: public_member_api_docs, sort_constructors_first
class StockVariationVO {
  List<String>? listTimestampConverted;
  List<double>? listOpen;
  List<String>? listProfitability;
  List<String>? listDayVariation;
  List<String>? listVariationFromTheFirstDate;
  List<double>? listDataChartSparkline;
  String? symbol;

  StockVariationVO({
    this.listTimestampConverted,
    this.listOpen,
    this.listProfitability,
    this.listDayVariation,
    this.listVariationFromTheFirstDate,
    this.listDataChartSparkline,
    this.symbol,
  });
}
