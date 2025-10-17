// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_assortiment_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelAssortimentDBCollection on Isar {
  IsarCollection<ModelAssortimentDB> get modelAssortimentDBs =>
      this.collection();
}

const ModelAssortimentDBSchema = CollectionSchema(
  name: r'ModelAssortimentDB',
  id: 8186218591099331952,
  properties: {
    r'barCode': PropertySchema(
      id: 0,
      name: r'barCode',
      type: IsarType.string,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'countInPackage': PropertySchema(
      id: 2,
      name: r'countInPackage',
      type: IsarType.double,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 4,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'isFolder': PropertySchema(
      id: 5,
      name: r'isFolder',
      type: IsarType.bool,
    ),
    r'marking': PropertySchema(
      id: 6,
      name: r'marking',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'nonWhole': PropertySchema(
      id: 8,
      name: r'nonWhole',
      type: IsarType.bool,
    ),
    r'parentUid': PropertySchema(
      id: 9,
      name: r'parentUid',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 10,
      name: r'price',
      type: IsarType.double,
    ),
    r'pricelineUid': PropertySchema(
      id: 11,
      name: r'pricelineUid',
      type: IsarType.string,
    ),
    r'remain': PropertySchema(
      id: 12,
      name: r'remain',
      type: IsarType.double,
    ),
    r'uid': PropertySchema(
      id: 13,
      name: r'uid',
      type: IsarType.string,
    ),
    r'unitInPackage': PropertySchema(
      id: 14,
      name: r'unitInPackage',
      type: IsarType.string,
    ),
    r'unitName': PropertySchema(
      id: 15,
      name: r'unitName',
      type: IsarType.string,
    )
  },
  estimateSize: _modelAssortimentDBEstimateSize,
  serialize: _modelAssortimentDBSerialize,
  deserialize: _modelAssortimentDBDeserialize,
  deserializeProp: _modelAssortimentDBDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _modelAssortimentDBGetId,
  getLinks: _modelAssortimentDBGetLinks,
  attach: _modelAssortimentDBAttach,
  version: '3.1.0+1',
);

int _modelAssortimentDBEstimateSize(
  ModelAssortimentDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.barCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.code;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.marking;
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
    final value = object.parentUid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pricelineUid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unitInPackage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unitName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _modelAssortimentDBSerialize(
  ModelAssortimentDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barCode);
  writer.writeString(offsets[1], object.code);
  writer.writeDouble(offsets[2], object.countInPackage);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.fullName);
  writer.writeBool(offsets[5], object.isFolder);
  writer.writeString(offsets[6], object.marking);
  writer.writeString(offsets[7], object.name);
  writer.writeBool(offsets[8], object.nonWhole);
  writer.writeString(offsets[9], object.parentUid);
  writer.writeDouble(offsets[10], object.price);
  writer.writeString(offsets[11], object.pricelineUid);
  writer.writeDouble(offsets[12], object.remain);
  writer.writeString(offsets[13], object.uid);
  writer.writeString(offsets[14], object.unitInPackage);
  writer.writeString(offsets[15], object.unitName);
}

ModelAssortimentDB _modelAssortimentDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelAssortimentDB(
    barCode: reader.readStringOrNull(offsets[0]),
    code: reader.readStringOrNull(offsets[1]),
    countInPackage: reader.readDoubleOrNull(offsets[2]),
    description: reader.readStringOrNull(offsets[3]),
    fullName: reader.readStringOrNull(offsets[4]),
    isFolder: reader.readBoolOrNull(offsets[5]),
    marking: reader.readStringOrNull(offsets[6]),
    name: reader.readStringOrNull(offsets[7]),
    nonWhole: reader.readBoolOrNull(offsets[8]),
    parentUid: reader.readStringOrNull(offsets[9]),
    price: reader.readDoubleOrNull(offsets[10]),
    pricelineUid: reader.readStringOrNull(offsets[11]),
    remain: reader.readDoubleOrNull(offsets[12]),
    uid: reader.readStringOrNull(offsets[13]),
    unitInPackage: reader.readStringOrNull(offsets[14]),
    unitName: reader.readStringOrNull(offsets[15]),
  );
  object.id = id;
  return object;
}

P _modelAssortimentDBDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelAssortimentDBGetId(ModelAssortimentDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modelAssortimentDBGetLinks(
    ModelAssortimentDB object) {
  return [];
}

void _modelAssortimentDBAttach(
    IsarCollection<dynamic> col, Id id, ModelAssortimentDB object) {
  object.id = id;
}

extension ModelAssortimentDBQueryWhereSort
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QWhere> {
  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelAssortimentDBQueryWhere
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QWhereClause> {
  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterWhereClause>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterWhereClause>
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

extension ModelAssortimentDBQueryFilter
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QFilterCondition> {
  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'barCode',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'barCode',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      barCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeEqualTo(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeGreaterThan(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeLessThan(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      countInPackageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countInPackage',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      countInPackageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countInPackage',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      countInPackageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countInPackage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      countInPackageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countInPackage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      countInPackageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countInPackage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      countInPackageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countInPackage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      isFolderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFolder',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      isFolderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFolder',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      isFolderEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFolder',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'marking',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'marking',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marking',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marking',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marking',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marking',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'marking',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'marking',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'marking',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'marking',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marking',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      markingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'marking',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nonWholeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nonWhole',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nonWholeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nonWhole',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      nonWholeEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nonWhole',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentUid',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentUid',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      parentUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      priceEqualTo(
    double? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      priceGreaterThan(
    double? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      priceLessThan(
    double? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      priceBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pricelineUid',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pricelineUid',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricelineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricelineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricelineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricelineUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pricelineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pricelineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pricelineUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pricelineUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricelineUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      pricelineUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pricelineUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      remainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remain',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      remainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remain',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      remainEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      remainGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      remainLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      remainBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidEqualTo(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidGreaterThan(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidLessThan(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitInPackage',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitInPackage',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitInPackage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitInPackage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitInPackage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitInPackage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitInPackage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitInPackage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitInPackage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitInPackage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitInPackage',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitInPackageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitInPackage',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitName',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameEqualTo(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameGreaterThan(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameLessThan(
    String? value, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
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

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitName',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterFilterCondition>
      unitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitName',
        value: '',
      ));
    });
  }
}

extension ModelAssortimentDBQueryObject
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QFilterCondition> {}

extension ModelAssortimentDBQueryLinks
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QFilterCondition> {}

extension ModelAssortimentDBQuerySortBy
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QSortBy> {
  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByBarCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCode', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByBarCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCode', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByCountInPackage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countInPackage', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByCountInPackageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countInPackage', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByIsFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFolder', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByIsFolderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFolder', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByMarking() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marking', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByMarkingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marking', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByNonWhole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonWhole', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByNonWholeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonWhole', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByParentUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentUid', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByParentUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentUid', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByPricelineUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricelineUid', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByPricelineUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricelineUid', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByRemain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remain', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByRemainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remain', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByUnitInPackage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitInPackage', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByUnitInPackageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitInPackage', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      sortByUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.desc);
    });
  }
}

extension ModelAssortimentDBQuerySortThenBy
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QSortThenBy> {
  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByBarCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCode', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByBarCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCode', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByCountInPackage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countInPackage', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByCountInPackageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countInPackage', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByIsFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFolder', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByIsFolderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFolder', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByMarking() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marking', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByMarkingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marking', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByNonWhole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonWhole', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByNonWholeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nonWhole', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByParentUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentUid', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByParentUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentUid', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByPricelineUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricelineUid', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByPricelineUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricelineUid', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByRemain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remain', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByRemainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remain', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByUnitInPackage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitInPackage', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByUnitInPackageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitInPackage', Sort.desc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.asc);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QAfterSortBy>
      thenByUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitName', Sort.desc);
    });
  }
}

extension ModelAssortimentDBQueryWhereDistinct
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct> {
  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByBarCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByCountInPackage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countInPackage');
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByFullName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByIsFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFolder');
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByMarking({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marking', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByNonWhole() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nonWhole');
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByParentUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByPricelineUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricelineUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByRemain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remain');
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByUnitInPackage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitInPackage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QDistinct>
      distinctByUnitName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitName', caseSensitive: caseSensitive);
    });
  }
}

extension ModelAssortimentDBQueryProperty
    on QueryBuilder<ModelAssortimentDB, ModelAssortimentDB, QQueryProperty> {
  QueryBuilder<ModelAssortimentDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations>
      barCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barCode');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<ModelAssortimentDB, double?, QQueryOperations>
      countInPackageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countInPackage');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations>
      fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<ModelAssortimentDB, bool?, QQueryOperations> isFolderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFolder');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations>
      markingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marking');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ModelAssortimentDB, bool?, QQueryOperations> nonWholeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nonWhole');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations>
      parentUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentUid');
    });
  }

  QueryBuilder<ModelAssortimentDB, double?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations>
      pricelineUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricelineUid');
    });
  }

  QueryBuilder<ModelAssortimentDB, double?, QQueryOperations> remainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remain');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations>
      unitInPackageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitInPackage');
    });
  }

  QueryBuilder<ModelAssortimentDB, String?, QQueryOperations>
      unitNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitName');
    });
  }
}
