// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPricesCollection on Isar {
  IsarCollection<Prices> get prices => this.collection();
}

const PricesSchema = CollectionSchema(
  name: r'Prices',
  id: 3807166709622644808,
  properties: {
    r'assortimentUid': PropertySchema(
      id: 0,
      name: r'assortimentUid',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 1,
      name: r'price',
      type: IsarType.double,
    ),
    r'priceLineUid': PropertySchema(
      id: 2,
      name: r'priceLineUid',
      type: IsarType.string,
    )
  },
  estimateSize: _pricesEstimateSize,
  serialize: _pricesSerialize,
  deserialize: _pricesDeserialize,
  deserializeProp: _pricesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pricesGetId,
  getLinks: _pricesGetLinks,
  attach: _pricesAttach,
  version: '3.1.0+1',
);

int _pricesEstimateSize(
  Prices object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.assortimentUid.length * 3;
  bytesCount += 3 + object.priceLineUid.length * 3;
  return bytesCount;
}

void _pricesSerialize(
  Prices object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assortimentUid);
  writer.writeDouble(offsets[1], object.price);
  writer.writeString(offsets[2], object.priceLineUid);
}

Prices _pricesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Prices(
    assortimentUid: reader.readString(offsets[0]),
    price: reader.readDouble(offsets[1]),
    priceLineUid: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _pricesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pricesGetId(Prices object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pricesGetLinks(Prices object) {
  return [];
}

void _pricesAttach(IsarCollection<dynamic> col, Id id, Prices object) {
  object.id = id;
}

extension PricesQueryWhereSort on QueryBuilder<Prices, Prices, QWhere> {
  QueryBuilder<Prices, Prices, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PricesQueryWhere on QueryBuilder<Prices, Prices, QWhereClause> {
  QueryBuilder<Prices, Prices, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Prices, Prices, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Prices, Prices, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Prices, Prices, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PricesQueryFilter on QueryBuilder<Prices, Prices, QFilterCondition> {
  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assortimentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assortimentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assortimentUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assortimentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assortimentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> assortimentUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentUid',
        value: '',
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition>
      assortimentUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentUid',
        value: '',
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceLineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceLineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceLineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceLineUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priceLineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priceLineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priceLineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priceLineUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceLineUid',
        value: '',
      ));
    });
  }

  QueryBuilder<Prices, Prices, QAfterFilterCondition> priceLineUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priceLineUid',
        value: '',
      ));
    });
  }
}

extension PricesQueryObject on QueryBuilder<Prices, Prices, QFilterCondition> {}

extension PricesQueryLinks on QueryBuilder<Prices, Prices, QFilterCondition> {}

extension PricesQuerySortBy on QueryBuilder<Prices, Prices, QSortBy> {
  QueryBuilder<Prices, Prices, QAfterSortBy> sortByAssortimentUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.asc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> sortByAssortimentUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.desc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> sortByPriceLineUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceLineUid', Sort.asc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> sortByPriceLineUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceLineUid', Sort.desc);
    });
  }
}

extension PricesQuerySortThenBy on QueryBuilder<Prices, Prices, QSortThenBy> {
  QueryBuilder<Prices, Prices, QAfterSortBy> thenByAssortimentUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.asc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> thenByAssortimentUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.desc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> thenByPriceLineUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceLineUid', Sort.asc);
    });
  }

  QueryBuilder<Prices, Prices, QAfterSortBy> thenByPriceLineUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceLineUid', Sort.desc);
    });
  }
}

extension PricesQueryWhereDistinct on QueryBuilder<Prices, Prices, QDistinct> {
  QueryBuilder<Prices, Prices, QDistinct> distinctByAssortimentUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentUid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Prices, Prices, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<Prices, Prices, QDistinct> distinctByPriceLineUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceLineUid', caseSensitive: caseSensitive);
    });
  }
}

extension PricesQueryProperty on QueryBuilder<Prices, Prices, QQueryProperty> {
  QueryBuilder<Prices, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Prices, String, QQueryOperations> assortimentUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentUid');
    });
  }

  QueryBuilder<Prices, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<Prices, String, QQueryOperations> priceLineUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceLineUid');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      assortimentUid: json['AssortimentUid'] as String? ?? '',
      price: (json['Price'] as num?)?.toDouble() ?? 0.0,
      priceLineUid: json['PriceLineUid'] as String? ?? '',
    );

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'AssortimentUid': instance.assortimentUid,
      'Price': instance.price,
      'PriceLineUid': instance.priceLineUid,
    };
