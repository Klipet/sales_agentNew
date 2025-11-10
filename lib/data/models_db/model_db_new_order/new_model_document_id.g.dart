// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_model_document_id.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNewModelDocumentIdCollection on Isar {
  IsarCollection<NewModelDocumentId> get newModelDocumentIds =>
      this.collection();
}

const NewModelDocumentIdSchema = CollectionSchema(
  name: r'NewModelDocumentId',
  id: -3054214468879502930,
  properties: {
    r'dicumentId': PropertySchema(
      id: 0,
      name: r'dicumentId',
      type: IsarType.long,
    )
  },
  estimateSize: _newModelDocumentIdEstimateSize,
  serialize: _newModelDocumentIdSerialize,
  deserialize: _newModelDocumentIdDeserialize,
  deserializeProp: _newModelDocumentIdDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _newModelDocumentIdGetId,
  getLinks: _newModelDocumentIdGetLinks,
  attach: _newModelDocumentIdAttach,
  version: '3.1.0+1',
);

int _newModelDocumentIdEstimateSize(
  NewModelDocumentId object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _newModelDocumentIdSerialize(
  NewModelDocumentId object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dicumentId);
}

NewModelDocumentId _newModelDocumentIdDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewModelDocumentId();
  object.dicumentId = reader.readLong(offsets[0]);
  object.id = id;
  return object;
}

P _newModelDocumentIdDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _newModelDocumentIdGetId(NewModelDocumentId object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _newModelDocumentIdGetLinks(
    NewModelDocumentId object) {
  return [];
}

void _newModelDocumentIdAttach(
    IsarCollection<dynamic> col, Id id, NewModelDocumentId object) {
  object.id = id;
}

extension NewModelDocumentIdQueryWhereSort
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QWhere> {
  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NewModelDocumentIdQueryWhere
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QWhereClause> {
  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterWhereClause>
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

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterWhereClause>
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

extension NewModelDocumentIdQueryFilter
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QFilterCondition> {
  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterFilterCondition>
      dicumentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dicumentId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterFilterCondition>
      dicumentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dicumentId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterFilterCondition>
      dicumentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dicumentId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterFilterCondition>
      dicumentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dicumentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterFilterCondition>
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

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterFilterCondition>
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

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterFilterCondition>
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
}

extension NewModelDocumentIdQueryObject
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QFilterCondition> {}

extension NewModelDocumentIdQueryLinks
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QFilterCondition> {}

extension NewModelDocumentIdQuerySortBy
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QSortBy> {
  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterSortBy>
      sortByDicumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dicumentId', Sort.asc);
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterSortBy>
      sortByDicumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dicumentId', Sort.desc);
    });
  }
}

extension NewModelDocumentIdQuerySortThenBy
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QSortThenBy> {
  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterSortBy>
      thenByDicumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dicumentId', Sort.asc);
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterSortBy>
      thenByDicumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dicumentId', Sort.desc);
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension NewModelDocumentIdQueryWhereDistinct
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QDistinct> {
  QueryBuilder<NewModelDocumentId, NewModelDocumentId, QDistinct>
      distinctByDicumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dicumentId');
    });
  }
}

extension NewModelDocumentIdQueryProperty
    on QueryBuilder<NewModelDocumentId, NewModelDocumentId, QQueryProperty> {
  QueryBuilder<NewModelDocumentId, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NewModelDocumentId, int, QQueryOperations> dicumentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dicumentId');
    });
  }
}
