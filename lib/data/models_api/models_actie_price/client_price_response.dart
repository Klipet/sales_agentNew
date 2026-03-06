import '../models_documents/token.dart';

class ClientPriceResponse {
  final int errorCode;
  final String? errorMessage;
  final List<PriceItem> prices;
  final Token token;

  ClientPriceResponse({
    required this.errorCode,
    this.errorMessage,
    required this.prices,
    required this.token,
  });

  factory ClientPriceResponse.fromJson(Map<String, dynamic> json) {
    return ClientPriceResponse(
      errorCode: json['ErrorCode'] ?? 0,
      errorMessage: json['ErrorMessage'],
      prices: (json['Prices'] as List<dynamic>?)
          ?.map((e) => PriceItem.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      token: Token.fromJson(json['Token'] as Map<String, dynamic>),
    );
  }
}

class PriceItem {
  final String assortimentUid;
  final double price;
  final String priceLineUid;

  PriceItem({
    required this.assortimentUid,
    required this.price,
    required this.priceLineUid,
  });

  factory PriceItem.fromJson(Map<String, dynamic> json) {
    return PriceItem(
      assortimentUid: json['AssortimentUid'] ?? '',
      price: (json['Price'] as num).toDouble(),
      priceLineUid: json['PriceLineUid'] ?? '',
    );
  }
}