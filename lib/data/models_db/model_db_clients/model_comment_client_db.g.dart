// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_comment_client_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelCommentClientDbCollection on Isar {
  IsarCollection<ModelCommentClientDb> get modelCommentClientDbs =>
      this.collection();
}

const ModelCommentClientDbSchema = CollectionSchema(
  name: r'ModelCommentClientDb',
  id: 3508376170511559841,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'clientUUid': PropertySchema(
      id: 1,
      name: r'clientUUid',
      type: IsarType.string,
    ),
    r'comment': PropertySchema(
      id: 2,
      name: r'comment',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 4,
      name: r'phone',
      type: IsarType.string,
    ),
    r'saveComment': PropertySchema(
      id: 5,
      name: r'saveComment',
      type: IsarType.bool,
    ),
    r'surName': PropertySchema(
      id: 6,
      name: r'surName',
      type: IsarType.string,
    )
  },
  estimateSize: _modelCommentClientDbEstimateSize,
  serialize: _modelCommentClientDbSerialize,
  deserialize: _modelCommentClientDbDeserialize,
  deserializeProp: _modelCommentClientDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'commentClient': LinkSchema(
      id: -4216534660180835118,
      name: r'commentClient',
      target: r'ModelClientDb',
      single: true,
      linkName: r'commentClient',
    )
  },
  embeddedSchemas: {},
  getId: _modelCommentClientDbGetId,
  getLinks: _modelCommentClientDbGetLinks,
  attach: _modelCommentClientDbAttach,
  version: '3.1.0+1',
);

int _modelCommentClientDbEstimateSize(
  ModelCommentClientDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.clientUUid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.comment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _modelCommentClientDbSerialize(
  ModelCommentClientDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.clientUUid);
  writer.writeString(offsets[2], object.comment);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.phone);
  writer.writeBool(offsets[5], object.saveComment);
  writer.writeString(offsets[6], object.surName);
}

ModelCommentClientDb _modelCommentClientDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelCommentClientDb(
    address: reader.readStringOrNull(offsets[0]),
    clientUUid: reader.readStringOrNull(offsets[1]),
    comment: reader.readStringOrNull(offsets[2]),
    name: reader.readStringOrNull(offsets[3]),
    phone: reader.readStringOrNull(offsets[4]),
    surName: reader.readStringOrNull(offsets[6]),
  );
  object.id = id;
  object.saveComment = reader.readBool(offsets[5]);
  return object;
}

P _modelCommentClientDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelCommentClientDbGetId(ModelCommentClientDb object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modelCommentClientDbGetLinks(
    ModelCommentClientDb object) {
  return [object.commentClient];
}

void _modelCommentClientDbAttach(
    IsarCollection<dynamic> col, Id id, ModelCommentClientDb object) {
  object.id = id;
  object.commentClient
      .attach(col, col.isar.collection<ModelClientDb>(), r'commentClient', id);
}

extension ModelCommentClientDbQueryWhereSort
    on QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QWhere> {
  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelCommentClientDbQueryWhere
    on QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QWhereClause> {
  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterWhereClause>
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterWhereClause>
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
}

extension ModelCommentClientDbQueryFilter on QueryBuilder<ModelCommentClientDb,
    ModelCommentClientDb, QFilterCondition> {
  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientUUid',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientUUid',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientUUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientUUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientUUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientUUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientUUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientUUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      clientUUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientUUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      clientUUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientUUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientUUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> clientUUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientUUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentEqualTo(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentGreaterThan(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentLessThan(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentBetween(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentStartsWith(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentEndsWith(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      commentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      commentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> saveCommentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saveComment',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surName',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surName',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      surNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
          QAfterFilterCondition>
      surNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> surNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surName',
        value: '',
      ));
    });
  }
}

extension ModelCommentClientDbQueryObject on QueryBuilder<ModelCommentClientDb,
    ModelCommentClientDb, QFilterCondition> {}

extension ModelCommentClientDbQueryLinks on QueryBuilder<ModelCommentClientDb,
    ModelCommentClientDb, QFilterCondition> {
  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentClient(FilterQuery<ModelClientDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'commentClient');
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb,
      QAfterFilterCondition> commentClientIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'commentClient', 0, true, 0, true);
    });
  }
}

extension ModelCommentClientDbQuerySortBy
    on QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QSortBy> {
  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByClientUUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUUid', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByClientUUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUUid', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortBySaveComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saveComment', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortBySaveCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saveComment', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortBySurName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surName', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      sortBySurNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surName', Sort.desc);
    });
  }
}

extension ModelCommentClientDbQuerySortThenBy
    on QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QSortThenBy> {
  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByClientUUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUUid', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByClientUUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientUUid', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenBySaveComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saveComment', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenBySaveCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saveComment', Sort.desc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenBySurName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surName', Sort.asc);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QAfterSortBy>
      thenBySurNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surName', Sort.desc);
    });
  }
}

extension ModelCommentClientDbQueryWhereDistinct
    on QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QDistinct> {
  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QDistinct>
      distinctByAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QDistinct>
      distinctByClientUUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientUUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QDistinct>
      distinctByComment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QDistinct>
      distinctByPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QDistinct>
      distinctBySaveComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saveComment');
    });
  }

  QueryBuilder<ModelCommentClientDb, ModelCommentClientDb, QDistinct>
      distinctBySurName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surName', caseSensitive: caseSensitive);
    });
  }
}

extension ModelCommentClientDbQueryProperty on QueryBuilder<
    ModelCommentClientDb, ModelCommentClientDb, QQueryProperty> {
  QueryBuilder<ModelCommentClientDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModelCommentClientDb, String?, QQueryOperations>
      addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<ModelCommentClientDb, String?, QQueryOperations>
      clientUUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientUUid');
    });
  }

  QueryBuilder<ModelCommentClientDb, String?, QQueryOperations>
      commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<ModelCommentClientDb, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ModelCommentClientDb, String?, QQueryOperations>
      phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<ModelCommentClientDb, bool, QQueryOperations>
      saveCommentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saveComment');
    });
  }

  QueryBuilder<ModelCommentClientDb, String?, QQueryOperations>
      surNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surName');
    });
  }
}
