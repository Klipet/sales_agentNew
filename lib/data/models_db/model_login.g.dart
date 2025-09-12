// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_login.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModelLoginCollection on Isar {
  IsarCollection<ModelLogin> get modelLogins => this.collection();
}

const ModelLoginSchema = CollectionSchema(
  name: r'ModelLogin',
  id: 7505315058451117507,
  properties: {
    r'login': PropertySchema(
      id: 0,
      name: r'login',
      type: IsarType.string,
    ),
    r'password': PropertySchema(
      id: 1,
      name: r'password',
      type: IsarType.string,
    ),
    r'savePass': PropertySchema(
      id: 2,
      name: r'savePass',
      type: IsarType.bool,
    ),
    r'tokenUid': PropertySchema(
      id: 3,
      name: r'tokenUid',
      type: IsarType.string,
    ),
    r'tokenValid': PropertySchema(
      id: 4,
      name: r'tokenValid',
      type: IsarType.string,
    )
  },
  estimateSize: _modelLoginEstimateSize,
  serialize: _modelLoginSerialize,
  deserialize: _modelLoginDeserialize,
  deserializeProp: _modelLoginDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _modelLoginGetId,
  getLinks: _modelLoginGetLinks,
  attach: _modelLoginAttach,
  version: '3.1.0+1',
);

int _modelLoginEstimateSize(
  ModelLogin object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.login.length * 3;
  bytesCount += 3 + object.password.length * 3;
  bytesCount += 3 + object.tokenUid.length * 3;
  bytesCount += 3 + object.tokenValid.length * 3;
  return bytesCount;
}

void _modelLoginSerialize(
  ModelLogin object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.login);
  writer.writeString(offsets[1], object.password);
  writer.writeBool(offsets[2], object.savePass);
  writer.writeString(offsets[3], object.tokenUid);
  writer.writeString(offsets[4], object.tokenValid);
}

ModelLogin _modelLoginDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModelLogin();
  object.id = id;
  object.login = reader.readString(offsets[0]);
  object.password = reader.readString(offsets[1]);
  object.savePass = reader.readBool(offsets[2]);
  object.tokenUid = reader.readString(offsets[3]);
  object.tokenValid = reader.readString(offsets[4]);
  return object;
}

P _modelLoginDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _modelLoginGetId(ModelLogin object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modelLoginGetLinks(ModelLogin object) {
  return [];
}

void _modelLoginAttach(IsarCollection<dynamic> col, Id id, ModelLogin object) {
  object.id = id;
}

extension ModelLoginQueryWhereSort
    on QueryBuilder<ModelLogin, ModelLogin, QWhere> {
  QueryBuilder<ModelLogin, ModelLogin, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModelLoginQueryWhere
    on QueryBuilder<ModelLogin, ModelLogin, QWhereClause> {
  QueryBuilder<ModelLogin, ModelLogin, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ModelLogin, ModelLogin, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterWhereClause> idBetween(
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

extension ModelLoginQueryFilter
    on QueryBuilder<ModelLogin, ModelLogin, QFilterCondition> {
  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'login',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'login',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'login',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> loginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      loginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'login',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> passwordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      passwordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> passwordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> passwordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'password',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      passwordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> passwordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> passwordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> passwordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'password',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      passwordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'password',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      passwordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'password',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> savePassEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'savePass',
        value: value,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenUidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenUid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenUidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenUidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenUidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenUid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenUidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenUid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenUid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenValidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenValidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenValidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenValidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenValid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenValidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenValidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenValidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition> tokenValidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenValid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenValidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenValid',
        value: '',
      ));
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterFilterCondition>
      tokenValidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenValid',
        value: '',
      ));
    });
  }
}

extension ModelLoginQueryObject
    on QueryBuilder<ModelLogin, ModelLogin, QFilterCondition> {}

extension ModelLoginQueryLinks
    on QueryBuilder<ModelLogin, ModelLogin, QFilterCondition> {}

extension ModelLoginQuerySortBy
    on QueryBuilder<ModelLogin, ModelLogin, QSortBy> {
  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortByPassword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortByPasswordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortBySavePass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savePass', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortBySavePassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savePass', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortByTokenUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenUid', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortByTokenUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenUid', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortByTokenValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenValid', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> sortByTokenValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenValid', Sort.desc);
    });
  }
}

extension ModelLoginQuerySortThenBy
    on QueryBuilder<ModelLogin, ModelLogin, QSortThenBy> {
  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByLogin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByLoginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByPassword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByPasswordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenBySavePass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savePass', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenBySavePassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savePass', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByTokenUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenUid', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByTokenUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenUid', Sort.desc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByTokenValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenValid', Sort.asc);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QAfterSortBy> thenByTokenValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenValid', Sort.desc);
    });
  }
}

extension ModelLoginQueryWhereDistinct
    on QueryBuilder<ModelLogin, ModelLogin, QDistinct> {
  QueryBuilder<ModelLogin, ModelLogin, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'login', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QDistinct> distinctByPassword(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'password', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QDistinct> distinctBySavePass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savePass');
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QDistinct> distinctByTokenUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ModelLogin, ModelLogin, QDistinct> distinctByTokenValid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenValid', caseSensitive: caseSensitive);
    });
  }
}

extension ModelLoginQueryProperty
    on QueryBuilder<ModelLogin, ModelLogin, QQueryProperty> {
  QueryBuilder<ModelLogin, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModelLogin, String, QQueryOperations> loginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'login');
    });
  }

  QueryBuilder<ModelLogin, String, QQueryOperations> passwordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'password');
    });
  }

  QueryBuilder<ModelLogin, bool, QQueryOperations> savePassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savePass');
    });
  }

  QueryBuilder<ModelLogin, String, QQueryOperations> tokenUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenUid');
    });
  }

  QueryBuilder<ModelLogin, String, QQueryOperations> tokenValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenValid');
    });
  }
}
