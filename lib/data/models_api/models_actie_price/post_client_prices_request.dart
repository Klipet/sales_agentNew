class PostClientPricesRequest {
  final String clientUid;
  final List<String> pricelines;
  final String tokenUid;

  PostClientPricesRequest({
    required this.clientUid,
    required this.pricelines,
    required this.tokenUid,
  });

  Map<String, dynamic> toJson() {
    return {
      'ClientUid': clientUid,
      'Pricelines': pricelines,
      'TokenUid': tokenUid,
    };
  }
}
