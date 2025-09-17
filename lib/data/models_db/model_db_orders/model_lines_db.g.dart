// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_lines_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelLinesDbCollection on Isar {
  IsarCollection<ModelLinesDb> get modelLinesDbs => this.collection();
}

const ModelLinesDbSchema = CollectionSchema(
  name: r'ModelLinesDb',
  id: 9044474020924667217,
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
    r'price': PropertySchema(
      id: 6,
      name: r'price',
      type: IsarType.double,
    ),
    r'processedCount': PropertySchema(
      id: 7,
      name: r'processedCount',
      type: IsarType.double,
    ),
    r'sum': PropertySchema(
      id: 8,
      name: r'sum',
      type: IsarType.double,
    ),
    r'uid': PropertySchema(
      id: 9,
      name: r'uid',
      type: IsarType.string,
    ),
    r'unitName': PropertySchema(
      id: 10,
      name: r'unitName',
      type: IsarType.string,
    ),
    r'unitUid': PropertySchema(
      id: 11,
      name: r'unitUid',
      type: IsarType.string,
    )
  },
  estimateSize: _modelLinesDbEstimateSize,
  serialize: _modelLinesDbSerialize,
  deserialize: _modelLinesDbDeserialize,
  deserializeProp: _modelLinesDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'document': LinkSchema(
      id: 2313776077809029430,
      name: r'document',
      target: r'ModelDocumentDb',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _modelLinesDbGetId,
  getLinks: _modelLinesDbGetLinks,
  attach: _modelLinesDbAttach,
  version: '3.1.0+1',
);

int _modelLinesDbEstimateSize(
  ModelLinesDb object,
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

void _modelLinesDbSerialize(
  ModelLinesDb object,
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
  writer.writeDouble(offsets[6], object.price);
  writer.writeDouble(offsets[7], object.processedCount);
  writer.writeDouble(offsets[8], object.sum);
  writer.writeString(offsets[9], object.uid);
  writer.writeString(offsets[10], object.unitName);
  writer.writeString(offsets[11], object.unitUid);
}

ModelLinesDb _modelLinesDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelLinesDb(
    assortimentBarcode: reader.readString(offsets[0]),
    assortimentCode: reader.readString(offsets[1]),
    assortimentName: reader.readString(offsets[2]),
    assortimentUid: reader.readString(offsets[3]),
    count: reader.readDouble(offsets[4]),
    lineNumber: reader.readLong(offsets[5]),
    price: reader.readDouble(offsets[6]),
    processedCount: reader.readDouble(offsets[7]),
    sum: reader.readDouble(offsets[8]),
    uid: reader.readString(offsets[9]),
    unitName: reader.readString(offsets[10]),
    unitUid: reader.readString(offsets[11]),
  );
  object.id = id;
  return object;
}

P _modelLinesDbDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelLinesDbGetId(ModelLinesDb object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modelLinesDbGetLinks(ModelLinesDb object) {
  return [object.document];
}

void _modelLinesDbAttach(
    IsarCollection<dynamic> col, Id id, ModelLinesDb object) {
  object.id = id;
  object.document
      .attach(col, col.isar.collection<ModelDocumentDb>(), r'document', id);
}

extension ModelLinesDbQueryWhereSort
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QWhere> {
  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelLinesDbQueryWhere
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QWhereClause> {
  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterWhereClause> idBetween(
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

extension ModelLinesDbQueryFilter
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QFilterCondition> {
  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentBarcodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentBarcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentBarcodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentBarcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentBarcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentBarcode',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentBarcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentBarcode',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assortimentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assortimentUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assortimentUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      assortimentUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assortimentUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> countEqualTo(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> countLessThan(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> countBetween(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      lineNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lineNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> priceBetween(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> sumEqualTo(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> sumLessThan(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> sumBetween(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> uidEqualTo(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> uidLessThan(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> uidBetween(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> uidStartsWith(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> uidEndsWith(
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> uidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> uidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      unitNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      unitNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      unitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      unitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
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

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      unitUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      unitUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      unitUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      unitUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitUid',
        value: '',
      ));
    });
  }
}

extension ModelLinesDbQueryObject
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QFilterCondition> {}

extension ModelLinesDbQueryLinks
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QFilterCondition> {
  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition> document(
      FilterQuery<ModelDocumentDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'document');
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterFilterCondition>
      documentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'document', 0, true, 0, true);
    });
  }
}

extension ModelLinesDbQuerySortBy
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QSortBy> {
  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByAssortimentBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentBarcode', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByAssortimentBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentBarcode', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByAssortimentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentCode', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByAssortimentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentCode', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByAssortimentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentName', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByAssortimentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentName', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByAssortimentUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByAssortimentUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByLineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumber', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByLineNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumber', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByProcessedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedCount', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      sortByProcessedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedCount', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByUnitUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitUid', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> sortByUnitUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitUid', Sort.desc);
    });
  }
}

extension ModelLinesDbQuerySortThenBy
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QSortThenBy> {
  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByAssortimentBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentBarcode', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByAssortimentBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentBarcode', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByAssortimentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentCode', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByAssortimentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentCode', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByAssortimentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentName', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByAssortimentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentName', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByAssortimentUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByAssortimentUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assortimentUid', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByLineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumber', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByLineNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lineNumber', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByProcessedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedCount', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy>
      thenByProcessedCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'processedCount', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.desc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByUnitUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitUid', Sort.asc);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QAfterSortBy> thenByUnitUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitUid', Sort.desc);
    });
  }
}

extension ModelLinesDbQueryWhereDistinct
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> {
  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct>
      distinctByAssortimentBarcode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentBarcode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByAssortimentCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByAssortimentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByAssortimentUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assortimentUid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByLineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lineNumber');
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct>
      distinctByProcessedCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'processedCount');
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sum');
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByUnitName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLinesDb, ModelLinesDb, QDistinct> distinctByUnitUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitUid', caseSensitive: caseSensitive);
    });
  }
}

extension ModelLinesDbQueryProperty
    on QueryBuilder<ModelLinesDb, ModelLinesDb, QQueryProperty> {
  QueryBuilder<ModelLinesDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModelLinesDb, String, QQueryOperations>
      assortimentBarcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentBarcode');
    });
  }

  QueryBuilder<ModelLinesDb, String, QQueryOperations>
      assortimentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentCode');
    });
  }

  QueryBuilder<ModelLinesDb, String, QQueryOperations>
      assortimentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentName');
    });
  }

  QueryBuilder<ModelLinesDb, String, QQueryOperations>
      assortimentUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assortimentUid');
    });
  }

  QueryBuilder<ModelLinesDb, double, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<ModelLinesDb, int, QQueryOperations> lineNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lineNumber');
    });
  }

  QueryBuilder<ModelLinesDb, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<ModelLinesDb, double, QQueryOperations>
      processedCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'processedCount');
    });
  }

  QueryBuilder<ModelLinesDb, double, QQueryOperations> sumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sum');
    });
  }

  QueryBuilder<ModelLinesDb, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }

  QueryBuilder<ModelLinesDb, String, QQueryOperations> unitNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitName');
    });
  }

  QueryBuilder<ModelLinesDb, String, QQueryOperations> unitUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitUid');
    });
  }
}
