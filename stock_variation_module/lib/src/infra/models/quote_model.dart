import '../../domain/entities/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  QuoteModel({List<double>? open}) : super(open: open);

  factory QuoteModel.fromJson(dynamic json) {
    return QuoteModel(
        open: (json["open"] as List).map((e) {
      if (e == null) {
        return 0.0;
      }
      return e as double;
    }).toList());
  }
}
