// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_order_model_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNewOrderModelDbCollection on Isar {
  IsarCollection<NewOrderModelDb> get newOrderModelDbs => this.collection();
}

const NewOrderModelDbSchema = CollectionSchema(
  name: r'NewOrderModelDb',
  id: -8070528014568379790,
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
    r'tranmit': PropertySchema(
      id: 11,
      name: r'tranmit',
      type: IsarType.bool,
    ),
    r'uid': PropertySchema(
      id: 12,
      name: r'uid',
      type: IsarType.string,
    )
  },
  estimateSize: _newOrderModelDbEstimateSize,
  serialize: _newOrderModelDbSerialize,
  deserialize: _newOrderModelDbDeserialize,
  deserializeProp: _newOrderModelDbDeserializeProp,
  idName: r'id',
  indexes: {
    r'sum': IndexSchema(
      id: 8324731750180269936,
      name: r'sum',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sum',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'lines': LinkSchema(
      id: -5334115082834927400,
      name: r'lines',
      target: r'NewOrderLineModelDb',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _newOrderModelDbGetId,
  getLinks: _newOrderModelDbGetLinks,
  attach: _newOrderModelDbAttach,
  version: '3.1.0+1',
);

int _newOrderModelDbEstimateSize(
  NewOrderModelDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.clientName.length * 3;
  bytesCount += 3 + object.clientUid.length * 3;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.comment.length * 3;
  bytesCount += 3 + object.dateProcessed.length * 3;
  bytesCount += 3 + object.dateValid.length * 3;
  bytesCount += 3 + object.deliveryAddress.length * 3;
  bytesCount += 3 + object.stockName.length * 3;
  bytesCount += 3 + object.stockUid.length * 3;
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _newOrderModelDbSerialize(
  NewOrderModelDb object,
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
  writer.writeBool(offsets[11], object.tranmit);
  writer.writeString(offsets[12], object.uid);
}

NewOrderModelDb _newOrderModelDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewOrderModelDb();
  object.clientName = reader.readString(offsets[0]);
  object.clientUid = reader.readString(offsets[1]);
  object.code = reader.readString(offsets[2]);
  object.comment = reader.readString(offsets[3]);
  object.dateProcessed = reader.readString(offsets[4]);
  object.dateValid = reader.readString(offsets[5]);
  object.deliveryAddress = reader.readString(offsets[6]);
  object.id = id;
  object.state = reader.readLong(offsets[7]);
  object.stockName = reader.readString(offsets[8]);
  object.stockUid = reader.readString(offsets[9]);
  object.sum = reader.readDouble(offsets[10]);
  object.tranmit = reader.readBool(offsets[11]);
  object.uid = reader.readString(offsets[12]);
  return object;
}

P _newOrderModelDbDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _newOrderModelDbGetId(NewOrderModelDb object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _newOrderModelDbGetLinks(NewOrderModelDb object) {
  return [object.lines];
}

void _newOrderModelDbAttach(
    IsarCollection<dynamic> col, Id id, NewOrderModelDb object) {
  object.id = id;
  object.lines
      .attach(col, col.isar.collection<NewOrderLineModelDb>(), r'lines', id);
}

extension NewOrderModelDbQueryWhereSort
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QWhere> {
  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhere> anySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sum'),
      );
    });
  }
}

extension NewOrderModelDbQueryWhere
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QWhereClause> {
  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause> idBetween(
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause> sumEqualTo(
      double sum) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sum',
        value: [sum],
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause>
      sumNotEqualTo(double sum) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sum',
              lower: [],
              upper: [sum],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sum',
              lower: [sum],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sum',
              lower: [sum],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sum',
              lower: [],
              upper: [sum],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause>
      sumGreaterThan(
    double sum, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sum',
        lower: [sum],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause> sumLessThan(
    double sum, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sum',
        lower: [],
        upper: [sum],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterWhereClause> sumBetween(
    double lowerSum,
    double upperSum, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sum',
        lower: [lowerSum],
        includeLower: includeLower,
        upper: [upperSum],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NewOrderModelDbQueryFilter
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QFilterCondition> {
  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientNameEqualTo(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientNameGreaterThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientNameLessThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientNameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientUid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      clientUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientUid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      commentEqualTo(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      commentGreaterThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      commentLessThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      commentBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      commentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      commentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateProcessedEqualTo(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateProcessedGreaterThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateProcessedLessThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateProcessedBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateProcessedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateProcessed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateProcessedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateProcessed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateProcessedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateProcessed',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateProcessedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateProcessed',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateValidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateValidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateValid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateValidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateValid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      dateValidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateValid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      deliveryAddressEqualTo(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      deliveryAddressGreaterThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      deliveryAddressLessThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      deliveryAddressBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      deliveryAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deliveryAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      deliveryAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deliveryAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      deliveryAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      deliveryAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deliveryAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stateEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockNameEqualTo(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockNameGreaterThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockNameLessThan(
    String value, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockNameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stockName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stockName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stockName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stockUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stockUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockUid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      stockUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stockUid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      tranmitEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tranmit',
        value: value,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }
}

extension NewOrderModelDbQueryObject
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QFilterCondition> {}

extension NewOrderModelDbQueryLinks
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QFilterCondition> {
  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition> lines(
      FilterQuery<NewOrderLineModelDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'lines');
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      linesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', length, true, length, true);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      linesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, true, 0, true);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      linesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, false, 999999, true);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      linesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', 0, true, length, include);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
      linesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lines', length, include, 999999, true);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterFilterCondition>
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

extension NewOrderModelDbQuerySortBy
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QSortBy> {
  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByClientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByClientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByClientUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByClientUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByDateProcessed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateProcessed', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByDateProcessedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateProcessed', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByDateValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateValid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByDateValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateValid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByDeliveryAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryAddress', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByDeliveryAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryAddress', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByStockName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockName', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByStockNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockName', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByStockUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockUid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByStockUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockUid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> sortBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> sortBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> sortByTranmit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tranmit', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      sortByTranmitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tranmit', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension NewOrderModelDbQuerySortThenBy
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QSortThenBy> {
  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByClientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByClientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByClientUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByClientUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByDateProcessed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateProcessed', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByDateProcessedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateProcessed', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByDateValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateValid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByDateValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateValid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByDeliveryAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryAddress', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByDeliveryAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryAddress', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByStockName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockName', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByStockNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockName', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByStockUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockUid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByStockUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockUid', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenBySumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sum', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenByTranmit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tranmit', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy>
      thenByTranmitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tranmit', Sort.desc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension NewOrderModelDbQueryWhereDistinct
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> {
  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct>
      distinctByClientName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctByClientUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct>
      distinctByDateProcessed({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateProcessed',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctByDateValid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateValid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct>
      distinctByDeliveryAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state');
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctByStockName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctByStockUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctBySum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sum');
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct>
      distinctByTranmit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tranmit');
    });
  }

  QueryBuilder<NewOrderModelDb, NewOrderModelDb, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension NewOrderModelDbQueryProperty
    on QueryBuilder<NewOrderModelDb, NewOrderModelDb, QQueryProperty> {
  QueryBuilder<NewOrderModelDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations> clientNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientName');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations> clientUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientUid');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations>
      dateProcessedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateProcessed');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations> dateValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateValid');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations>
      deliveryAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryAddress');
    });
  }

  QueryBuilder<NewOrderModelDb, int, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations> stockNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockName');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations> stockUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockUid');
    });
  }

  QueryBuilder<NewOrderModelDb, double, QQueryOperations> sumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sum');
    });
  }

  QueryBuilder<NewOrderModelDb, bool, QQueryOperations> tranmitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tranmit');
    });
  }

  QueryBuilder<NewOrderModelDb, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
