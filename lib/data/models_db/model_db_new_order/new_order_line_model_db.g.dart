// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_line_model_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNewOrderLineModelDbCollection on Isar {
  IsarCollection<NewOrderLineModelDb> get newOrderLineModelDbs =>
      this.collection();
}

const NewOrderLineModelDbSchema = CollectionSchema(
  name: r'NewOrderLineModelDb',
  id: -5165746681875857532,
  properties: {
    r'assortimentBarcode': PropertySchema(
      id: 0,
      name: r'assortimentBarcode',
      type: IsarType.string,
    ),
    r'assortimentCode': PropertySchema(
      id: 1,
      name: r'assortimentCode',
      type: IsarType.string,
    ),
    r'assortimentName': PropertySchema(
      id: 2,
      name: r'assortimentName',
      type: IsarType.string,
    ),
    r'assortimentUid': PropertySchema(
      id: 3,
      name: r'assortimentUid',
      type: IsarType.string,
    ),
    r'count': PropertySchema(
      id: 4,
      name: r'count',
      type: IsarType.double,
    ),
    r'lineNumber': PropertySchema(
      id: 5,
      name: r'lineNumber',
      type: IsarType.long,
    ),
    r'orderId': PropertySchema(
      id: 6,
      name: r'orderId',
      type: IsarType.long,
    ),
    r'price': PropertySchema(
      id: 7,
      name: r'price',
      type: IsarType.double,
    ),
    r'processedCount': PropertySchema(
      id: 8,
      name: r'processedCount',
      type: IsarType.double,
    ),
    r'sum': PropertySchema(
      id: 9,
      name: r'sum',
      type: IsarType.double,
    ),
    r'uid': PropertySchema(
      id: 10,
      name: r'uid',
      type: IsarType.string,
    ),
    r'unitName': PropertySchema(
      id: 11,
      name: r'unitName',
      type: IsarType.string,
    ),
    r'unitUid': PropertySchema(
      id: 12,
      name: r'unitUid',
      type: IsarType.string,
    )
  },
  estimateSize: _newOrderLineModelDbEstimateSize,
  serialize: _newOrderLineModelDbSerialize,
  deserialize: _newOrderLineModelDbDeserialize,
  deserializeProp: _newOrderLineModelDbDeserializeProp,
  idName: r'id',
  indexes: {
    r'orderId': IndexSchema(
      id: -6176610178429382285,
      name: r'orderId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'orderId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _newOrderLineModelDbGetId,
  getLinks: _newOrderLineModelDbGetLinks,
  attach: _newOrderLineModelDbAttach,
  version: '3.1.0+1',
);

int _newOrderLineModelDbEstimateSize(
  NewOrderLineModelDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.assortimentBarcode.length * 3;
  bytesCount += 3 + object.assortimentCode.length * 3;
  bytesCount += 3 + object.assortimentName.length * 3;
  bytesCount += 3 + object.assortimentUid.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  bytesCount += 3 + object.unitName.length * 3;
  bytesCount += 3 + object.unitUid.length * 3;
  return bytesCount;
}

void _newOrderLineModelDbSerialize(
  NewOrderLineModelDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assortimentBarcode);
  writer.writeString(offsets[1], object.assortimentCode);
  writer.writeString(offsets[2], object.assortimentName);
  writer.writeString(offsets[3], object.assortimentUid);
  writer.writeDouble(offsets[4], object.count);
  writer.writeLong(offsets[5], object.lineNumber);
  writer.writeLong(offsets[6], object.orderId);
  writer.writeDouble(offsets[7], object.price);
  writer.writeDouble(offsets[8], object.processedCount);
  writer.writeDouble(offsets[9], object.sum);
  writer.writeString(offsets[10], object.uid);
  writer.writeString(offsets[11], object.unitName);
  writer.writeString(offsets[12], object.unitUid);
}

NewOrderLineModelDb _newOrderLineModelDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewOrderLineModelDb();
  object.assortimentBarcode = reader.readString(offsets[0]);
  object.assortimentCode = reader.readString(offsets[1]);
  object.assortimentName = reader.readString(offsets[2]);
  object.assortimentUid = reader.readString(offsets[3]);
  object.count = reader.readDouble(offsets[4]);
  object.id = id;
  object.lineNumber = reader.readLong(offsets[5]);
  object.orderId = reader.readLong(offsets[6]);
  object.price = reader.readDouble(offsets[7]);
  object.processedCount = reader.readDouble(offsets[8]);
  object.sum = reader.readDouble(offsets[9]);
  object.uid = reader.readString(offsets[10]);
  object.unitName = reader.readString(offsets[11]);
  object.unitUid = reader.readString(offsets[12]);
  return object;
}

P _newOrderLineModelDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _newOrderLineModelDbGetId(NewOrderLineModelDb object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _newOrderLineModelDbGetLinks(
    NewOrderLineModelDb object) {
  return [];
}

void _newOrderLineModelDbAttach(
    IsarCollection<dynamic> col, Id id, NewOrderLineModelDb object) {
  object.id = id;
}

extension NewOrderLineModelDbQueryWhereSort
    on QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QWhere> {
  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhere>
      anyOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'orderId'),
      );
    });
  }
}

extension NewOrderLineModelDbQueryWhere
    on QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QWhereClause> {
  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      orderIdEqualTo(int orderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderId',
        value: [orderId],
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      orderIdNotEqualTo(int orderId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderId',
              lower: [],
              upper: [orderId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderId',
              lower: [orderId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderId',
              lower: [orderId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderId',
              lower: [],
              upper: [orderId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      orderIdGreaterThan(
    int orderId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'orderId',
        lower: [orderId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      orderIdLessThan(
    int orderId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'orderId',
        lower: [],
        upper: [orderId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterWhereClause>
      orderIdBetween(
    int lowerOrderId,
    int upperOrderId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'orderId',
        lower: [lowerOrderId],
        includeLower: includeLower,
        upper: [upperOrderId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NewOrderLineModelDbQueryFilter on QueryBuilder<NewOrderLineModelDb,
    NewOrderLineModelDb, QFilterCondition> {
  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentBarcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assortimentBarcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assortimentBarcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assortimentBarcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assortimentBarcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assortimentBarcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentBarcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentBarcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentBarcode',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentBarcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentBarcode',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assortimentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assortimentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assortimentCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assortimentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assortimentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assortimentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assortimentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assortimentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assortimentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assortimentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidEqualTo(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidGreaterThan(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidLessThan(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidBetween(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidStartsWith(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidEndsWith(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentUid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      assortimentUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentUid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      countEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      countGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      countLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      countBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      lineNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      lineNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lineNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      lineNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lineNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      lineNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lineNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      orderIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      orderIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      orderIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      orderIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      priceEqualTo(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      priceGreaterThan(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      priceLessThan(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      priceBetween(
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

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      processedCountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'processedCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      processedCountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'processedCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      processedCountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'processedCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      processedCountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'processedCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      sumEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      sumGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      sumLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      sumBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitUid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterFilterCondition>
      unitUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitUid',
        value: '',
      ));
    });
  }
}

extension NewOrderLineModelDbQueryObject on QueryBuilder<NewOrderLineModelDb,
    NewOrderLineModelDb, QFilterCondition> {}

extension NewOrderLineModelDbQueryLinks on QueryBuilder<NewOrderLineModelDb,
    NewOrderLineModelDb, QFilterCondition> {}

extension NewOrderLineModelDbQuerySortBy
    on QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QSortBy> {
  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByAssortimentBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentBarcode', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByAssortimentBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentBarcode', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByAssortimentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentCode', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByAssortimentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentCode', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByAssortimentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentName', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByAssortimentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentName', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByAssortimentUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByAssortimentUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByLineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumber', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByLineNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumber', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByProcessedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedCount', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByProcessedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedCount', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByUnitUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitUid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      sortByUnitUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitUid', Sort.desc);
    });
  }
}

extension NewOrderLineModelDbQuerySortThenBy
    on QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QSortThenBy> {
  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByAssortimentBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentBarcode', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByAssortimentBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentBarcode', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByAssortimentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentCode', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByAssortimentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentCode', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByAssortimentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentName', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByAssortimentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentName', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByAssortimentUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByAssortimentUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByLineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumber', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByLineNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumber', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByProcessedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedCount', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByProcessedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedCount', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.desc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByUnitUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitUid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QAfterSortBy>
      thenByUnitUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitUid', Sort.desc);
    });
  }
}

extension NewOrderLineModelDbQueryWhereDistinct
    on QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct> {
  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByAssortimentBarcode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentBarcode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByAssortimentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByAssortimentName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByAssortimentUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentUid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByLineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lineNumber');
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderId');
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByProcessedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processedCount');
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sum');
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByUnitName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QDistinct>
      distinctByUnitUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitUid', caseSensitive: caseSensitive);
    });
  }
}

extension NewOrderLineModelDbQueryProperty
    on QueryBuilder<NewOrderLineModelDb, NewOrderLineModelDb, QQueryProperty> {
  QueryBuilder<NewOrderLineModelDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NewOrderLineModelDb, String, QQueryOperations>
      assortimentBarcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentBarcode');
    });
  }

  QueryBuilder<NewOrderLineModelDb, String, QQueryOperations>
      assortimentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentCode');
    });
  }

  QueryBuilder<NewOrderLineModelDb, String, QQueryOperations>
      assortimentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentName');
    });
  }

  QueryBuilder<NewOrderLineModelDb, String, QQueryOperations>
      assortimentUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentUid');
    });
  }

  QueryBuilder<NewOrderLineModelDb, double, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<NewOrderLineModelDb, int, QQueryOperations>
      lineNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lineNumber');
    });
  }

  QueryBuilder<NewOrderLineModelDb, int, QQueryOperations> orderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderId');
    });
  }

  QueryBuilder<NewOrderLineModelDb, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<NewOrderLineModelDb, double, QQueryOperations>
      processedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processedCount');
    });
  }

  QueryBuilder<NewOrderLineModelDb, double, QQueryOperations> sumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sum');
    });
  }

  QueryBuilder<NewOrderLineModelDb, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }

  QueryBuilder<NewOrderLineModelDb, String, QQueryOperations>
      unitNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitName');
    });
  }

  QueryBuilder<NewOrderLineModelDb, String, QQueryOperations>
      unitUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitUid');
    });
  }
}
