// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_document_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelDocumentDbCollection on Isar {
  IsarCollection<ModelDocumentDb> get modelDocumentDbs => this.collection();
}

const ModelDocumentDbSchema = CollectionSchema(
  name: r'ModelDocumentDb',
  id: -2697729323312958049,
  properties: {
    r'clientName': PropertySchema(
      id: 0,
      name: r'clientName',
      type: IsarType.string,
    ),
    r'clientUid': PropertySchema(
      id: 1,
      name: r'clientUid',
      type: IsarType.string,
    ),
    r'code': PropertySchema(
      id: 2,
      name: r'code',
      type: IsarType.string,
    ),
    r'comment': PropertySchema(
      id: 3,
      name: r'comment',
      type: IsarType.string,
    ),
    r'dateProcessed': PropertySchema(
      id: 4,
      name: r'dateProcessed',
      type: IsarType.string,
    ),
    r'dateValid': PropertySchema(
      id: 5,
      name: r'dateValid',
      type: IsarType.string,
    ),
    r'deliveryAddress': PropertySchema(
      id: 6,
      name: r'deliveryAddress',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 7,
      name: r'state',
      type: IsarType.long,
    ),
    r'stockName': PropertySchema(
      id: 8,
      name: r'stockName',
      type: IsarType.string,
    ),
    r'stockUid': PropertySchema(
      id: 9,
      name: r'stockUid',
      type: IsarType.string,
    ),
    r'sum': PropertySchema(
      id: 10,
      name: r'sum',
      type: IsarType.double,
    ),
    r'uid': PropertySchema(
      id: 11,
      name: r'uid',
      type: IsarType.string,
    )
  },
  estimateSize: _modelDocumentDbEstimateSize,
  serialize: _modelDocumentDbSerialize,
  deserialize: _modelDocumentDbDeserialize,
  deserializeProp: _modelDocumentDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'lines': LinkSchema(
      id: -4716182514177554878,
      name: r'lines',
      target: r'ModelLinesDb',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _modelDocumentDbGetId,
  getLinks: _modelDocumentDbGetLinks,
  attach: _modelDocumentDbAttach,
  version: '3.1.0+1',
);

int _modelDocumentDbEstimateSize(
  ModelDocumentDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.clientName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.clientUid.length * 3;
  bytesCount += 3 + object.code.length * 3;
  {
    final value = object.comment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateProcessed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.dateValid.length * 3;
  {
    final value = object.deliveryAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stockName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.stockUid.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _modelDocumentDbSerialize(
  ModelDocumentDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.clientName);
  writer.writeString(offsets[1], object.clientUid);
  writer.writeString(offsets[2], object.code);
  writer.writeString(offsets[3], object.comment);
  writer.writeString(offsets[4], object.dateProcessed);
  writer.writeString(offsets[5], object.dateValid);
  writer.writeString(offsets[6], object.deliveryAddress);
  writer.writeLong(offsets[7], object.state);
  writer.writeString(offsets[8], object.stockName);
  writer.writeString(offsets[9], object.stockUid);
  writer.writeDouble(offsets[10], object.sum);
  writer.writeString(offsets[11], object.uid);
}

ModelDocumentDb _modelDocumentDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelDocumentDb(
    clientName: reader.readStringOrNull(offsets[0]),
    clientUid: reader.readString(offsets[1]),
    code: reader.readString(offsets[2]),
    comment: reader.readStringOrNull(offsets[3]),
    dateProcessed: reader.readStringOrNull(offsets[4]),
    dateValid: reader.readString(offsets[5]),
    deliveryAddress: reader.readStringOrNull(offsets[6]),
    state: reader.readLong(offsets[7]),
    stockName: reader.readStringOrNull(offsets[8]),
    stockUid: reader.readString(offsets[9]),
    sum: reader.readDouble(offsets[10]),
    uid: reader.readString(offsets[11]),
  );
  object.id = id;
  return object;
}

P _modelDocumentDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelDocumentDbGetId(ModelDocumentDb object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modelDocumentDbGetLinks(ModelDocumentDb object) {
  return [object.lines];
}

void _modelDocumentDbAttach(
    IsarCollection<dynamic> col, Id id, ModelDocumentDb object) {
  object.id = id;
  object.lines.attach(col, col.isar.collection<ModelLinesDb>(), r'lines', id);
}

extension ModelDocumentDbQueryWhereSort
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QWhere> {
  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelDocumentDbQueryWhere
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QWhereClause> {
  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterWhereClause>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterWhereClause> idBetween(
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

extension ModelDocumentDbQueryFilter
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QFilterCondition> {
  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientName',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientName',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      clientUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateProcessed',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateProcessed',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateProcessed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateProcessed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateProcessed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateProcessed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateProcessed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateProcessed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateProcessed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateProcessed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateProcessed',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateProcessedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateProcessed',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateValid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateValid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateValid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      dateValidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateValid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveryAddress',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveryAddress',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveryAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveryAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveryAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deliveryAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deliveryAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deliveryAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deliveryAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      deliveryAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deliveryAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stateEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stateGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stateLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stockName',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stockName',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stockName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stockName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stockName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stockName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stockName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stockUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stockUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stockUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stockUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      stockUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stockUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }
}

extension ModelDocumentDbQueryObject
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QFilterCondition> {}

extension ModelDocumentDbQueryLinks
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QFilterCondition> {
  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition> lines(
      FilterQuery<ModelLinesDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'lines');
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      linesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', length, true, length, true);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      linesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, true, 0, true);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      linesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, false, 999999, true);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      linesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, true, length, include);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
      linesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', length, include, 999999, true);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterFilterCondition>
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

extension ModelDocumentDbQuerySortBy
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QSortBy> {
  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByClientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByClientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByClientUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUid', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByClientUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUid', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByDateProcessed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateProcessed', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByDateProcessedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateProcessed', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByDateValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateValid', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByDateValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateValid', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByDeliveryAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryAddress', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByDeliveryAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryAddress', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByStockName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockName', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByStockNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockName', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByStockUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockUid', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      sortByStockUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockUid', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> sortBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> sortBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension ModelDocumentDbQuerySortThenBy
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QSortThenBy> {
  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByClientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByClientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByClientUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUid', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByClientUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUid', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByDateProcessed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateProcessed', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByDateProcessedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateProcessed', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByDateValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateValid', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByDateValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateValid', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByDeliveryAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryAddress', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByDeliveryAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryAddress', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByStockName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockName', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByStockNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockName', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByStockUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockUid', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy>
      thenByStockUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockUid', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension ModelDocumentDbQueryWhereDistinct
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> {
  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct>
      distinctByClientName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctByClientUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct>
      distinctByDateProcessed({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateProcessed',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctByDateValid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateValid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct>
      distinctByDeliveryAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state');
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctByStockName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctByStockUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sum');
    });
  }

  QueryBuilder<ModelDocumentDb, ModelDocumentDb, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension ModelDocumentDbQueryProperty
    on QueryBuilder<ModelDocumentDb, ModelDocumentDb, QQueryProperty> {
  QueryBuilder<ModelDocumentDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModelDocumentDb, String?, QQueryOperations>
      clientNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientName');
    });
  }

  QueryBuilder<ModelDocumentDb, String, QQueryOperations> clientUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientUid');
    });
  }

  QueryBuilder<ModelDocumentDb, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<ModelDocumentDb, String?, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<ModelDocumentDb, String?, QQueryOperations>
      dateProcessedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateProcessed');
    });
  }

  QueryBuilder<ModelDocumentDb, String, QQueryOperations> dateValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateValid');
    });
  }

  QueryBuilder<ModelDocumentDb, String?, QQueryOperations>
      deliveryAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryAddress');
    });
  }

  QueryBuilder<ModelDocumentDb, int, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<ModelDocumentDb, String?, QQueryOperations> stockNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockName');
    });
  }

  QueryBuilder<ModelDocumentDb, String, QQueryOperations> stockUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockUid');
    });
  }

  QueryBuilder<ModelDocumentDb, double, QQueryOperations> sumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sum');
    });
  }

  QueryBuilder<ModelDocumentDb, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
