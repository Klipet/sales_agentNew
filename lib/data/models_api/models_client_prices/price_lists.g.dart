// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_lists.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPriceListsCollection on Isar {
  IsarCollection<PriceLists> get priceLists => this.collection();
}

const PriceListsSchema = CollectionSchema(
  name: r'PriceLists',
  id: -7804506938544064612,
  properties: {
    r'priceListUid': PropertySchema(
      id: 0,
      name: r'priceListUid',
      type: IsarType.string,
    )
  },
  estimateSize: _priceListsEstimateSize,
  serialize: _priceListsSerialize,
  deserialize: _priceListsDeserialize,
  deserializeProp: _priceListsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'lines': LinkSchema(
      id: -6054764745278497313,
      name: r'lines',
      target: r'Prices',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _priceListsGetId,
  getLinks: _priceListsGetLinks,
  attach: _priceListsAttach,
  version: '3.1.0+1',
);

int _priceListsEstimateSize(
  PriceLists object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.priceListUid.length * 3;
  return bytesCount;
}

void _priceListsSerialize(
  PriceLists object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.priceListUid);
}

PriceLists _priceListsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PriceLists(
    priceListUid: reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _priceListsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _priceListsGetId(PriceLists object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _priceListsGetLinks(PriceLists object) {
  return [object.lines];
}

void _priceListsAttach(IsarCollection<dynamic> col, Id id, PriceLists object) {
  object.id = id;
  object.lines.attach(col, col.isar.collection<Prices>(), r'lines', id);
}

extension PriceListsQueryWhereSort
    on QueryBuilder<PriceLists, PriceLists, QWhere> {
  QueryBuilder<PriceLists, PriceLists, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PriceListsQueryWhere
    on QueryBuilder<PriceLists, PriceLists, QWhereClause> {
  QueryBuilder<PriceLists, PriceLists, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PriceLists, PriceLists, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterWhereClause> idBetween(
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

extension PriceListsQueryFilter
    on QueryBuilder<PriceLists, PriceLists, QFilterCondition> {
  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceListUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceListUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceListUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceListUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priceListUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priceListUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priceListUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priceListUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceListUid',
        value: '',
      ));
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      priceListUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priceListUid',
        value: '',
      ));
    });
  }
}

extension PriceListsQueryObject
    on QueryBuilder<PriceLists, PriceLists, QFilterCondition> {}

extension PriceListsQueryLinks
    on QueryBuilder<PriceLists, PriceLists, QFilterCondition> {
  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition> lines(
      FilterQuery<Prices> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'lines');
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      linesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', length, true, length, true);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition> linesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, true, 0, true);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      linesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, false, 999999, true);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      linesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, true, length, include);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      linesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', length, include, 999999, true);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterFilterCondition>
      linesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'lines', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PriceListsQuerySortBy
    on QueryBuilder<PriceLists, PriceLists, QSortBy> {
  QueryBuilder<PriceLists, PriceLists, QAfterSortBy> sortByPriceListUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceListUid', Sort.asc);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterSortBy> sortByPriceListUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceListUid', Sort.desc);
    });
  }
}

extension PriceListsQuerySortThenBy
    on QueryBuilder<PriceLists, PriceLists, QSortThenBy> {
  QueryBuilder<PriceLists, PriceLists, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterSortBy> thenByPriceListUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceListUid', Sort.asc);
    });
  }

  QueryBuilder<PriceLists, PriceLists, QAfterSortBy> thenByPriceListUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceListUid', Sort.desc);
    });
  }
}

extension PriceListsQueryWhereDistinct
    on QueryBuilder<PriceLists, PriceLists, QDistinct> {
  QueryBuilder<PriceLists, PriceLists, QDistinct> distinctByPriceListUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceListUid', caseSensitive: caseSensitive);
    });
  }
}

extension PriceListsQueryProperty
    on QueryBuilder<PriceLists, PriceLists, QQueryProperty> {
  QueryBuilder<PriceLists, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PriceLists, String, QQueryOperations> priceListUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceListUid');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceLists _$PriceListsFromJson(Map<String, dynamic> json) => PriceLists(
      priceListUid: json['PriceListUid'] as String? ?? '',
    )..prices = (json['Prices'] as List<dynamic>?)
            ?.map((e) => Prices.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

Map<String, dynamic> _$PriceListsToJson(PriceLists instance) =>
    <String, dynamic>{
      'PriceListUid': instance.priceListUid,
      'Prices': instance.prices,
    };
