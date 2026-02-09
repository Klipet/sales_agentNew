import 'package:isar/isar.dart';

import '../models_api/models_client_prices/client_prices.dart';
import '../models_api/models_client_prices/price_lists.dart';
import '../models_api/models_client_prices/prices.dart';
import 'db_provider.dart';

class PriceRepositori {
  Future<void> saveClientPrice(ClientPrices clientPrice) async {
    final isar = await DbProvider.instance();
    for (var pl in clientPrice.priceLists) {
      final priceList = PriceLists(priceListUid: pl.priceListUid);
      final pricesObjects = pl.prices!
          .map(
            (p) => Prices(
              assortimentUid: p.assortimentUid,
              price: p.price,
              priceLineUid: p.priceLineUid,
            ),
          )
          .toList();
      await isar.writeTxn(() async {
        await isar.priceLists.put(priceList);
        await isar.prices.putAll(pricesObjects);

        priceList.lines.addAll(pricesObjects);
        await priceList.lines.save();
      });
    }
  }

  Future<void> deletePriceLine() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.priceLists.clear());
  }

  Future<void> deletePrice() async {
    final isar = await DbProvider.instance();
    await isar.writeTxn(() => isar.prices.clear());
  }

  Future<List<PriceLists>> getPriceListsFromIsar(String uuid) async {
    final isar = await Isar.getInstance();
    if (isar == null) return [];
    final allPriceLists = await isar.priceLists
        .filter()
        .priceListUidEqualTo(uuid)
      // .priceListUidContains(uuid)
        .findAll();
    if (allPriceLists.isEmpty) return [];
    return allPriceLists;
  }
}
