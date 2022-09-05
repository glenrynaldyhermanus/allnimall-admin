// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PetsRecord> _$petsRecordSerializer = new _$PetsRecordSerializer();

class _$PetsRecordSerializer implements StructuredSerializer<PetsRecord> {
  @override
  final Iterable<Type> types = const [PetsRecord, _$PetsRecord];
  @override
  final String wireName = 'PetsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PetsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.birthdate;
    if (value != null) {
      result
        ..add('birthdate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.breed;
    if (value != null) {
      result
        ..add('breed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.condition;
    if (value != null) {
      result
        ..add('condition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerName;
    if (value != null) {
      result
        ..add('owner_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ownerUid;
    if (value != null) {
      result
        ..add('owner_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.sex;
    if (value != null) {
      result
        ..add('sex')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weightUnit;
    if (value != null) {
      result
        ..add('weight_unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pictureUrl;
    if (value != null) {
      result
        ..add('picture_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PetsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'birthdate':
          result.birthdate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'breed':
          result.breed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'condition':
          result.condition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'owner_name':
          result.ownerName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'owner_uid':
          result.ownerUid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sex':
          result.sex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weight_unit':
          result.weightUnit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture_url':
          result.pictureUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PetsRecord extends PetsRecord {
  @override
  final DateTime? birthdate;
  @override
  final String? breed;
  @override
  final String? condition;
  @override
  final String? name;
  @override
  final String? ownerName;
  @override
  final DocumentReference<Object?>? ownerUid;
  @override
  final String? sex;
  @override
  final int? weight;
  @override
  final String? weightUnit;
  @override
  final String? pictureUrl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PetsRecord([void Function(PetsRecordBuilder)? updates]) =>
      (new PetsRecordBuilder()..update(updates))._build();

  _$PetsRecord._(
      {this.birthdate,
      this.breed,
      this.condition,
      this.name,
      this.ownerName,
      this.ownerUid,
      this.sex,
      this.weight,
      this.weightUnit,
      this.pictureUrl,
      this.ffRef})
      : super._();

  @override
  PetsRecord rebuild(void Function(PetsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetsRecordBuilder toBuilder() => new PetsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetsRecord &&
        birthdate == other.birthdate &&
        breed == other.breed &&
        condition == other.condition &&
        name == other.name &&
        ownerName == other.ownerName &&
        ownerUid == other.ownerUid &&
        sex == other.sex &&
        weight == other.weight &&
        weightUnit == other.weightUnit &&
        pictureUrl == other.pictureUrl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, birthdate.hashCode),
                                            breed.hashCode),
                                        condition.hashCode),
                                    name.hashCode),
                                ownerName.hashCode),
                            ownerUid.hashCode),
                        sex.hashCode),
                    weight.hashCode),
                weightUnit.hashCode),
            pictureUrl.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PetsRecord')
          ..add('birthdate', birthdate)
          ..add('breed', breed)
          ..add('condition', condition)
          ..add('name', name)
          ..add('ownerName', ownerName)
          ..add('ownerUid', ownerUid)
          ..add('sex', sex)
          ..add('weight', weight)
          ..add('weightUnit', weightUnit)
          ..add('pictureUrl', pictureUrl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PetsRecordBuilder implements Builder<PetsRecord, PetsRecordBuilder> {
  _$PetsRecord? _$v;

  DateTime? _birthdate;
  DateTime? get birthdate => _$this._birthdate;
  set birthdate(DateTime? birthdate) => _$this._birthdate = birthdate;

  String? _breed;
  String? get breed => _$this._breed;
  set breed(String? breed) => _$this._breed = breed;

  String? _condition;
  String? get condition => _$this._condition;
  set condition(String? condition) => _$this._condition = condition;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _ownerName;
  String? get ownerName => _$this._ownerName;
  set ownerName(String? ownerName) => _$this._ownerName = ownerName;

  DocumentReference<Object?>? _ownerUid;
  DocumentReference<Object?>? get ownerUid => _$this._ownerUid;
  set ownerUid(DocumentReference<Object?>? ownerUid) =>
      _$this._ownerUid = ownerUid;

  String? _sex;
  String? get sex => _$this._sex;
  set sex(String? sex) => _$this._sex = sex;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  String? _weightUnit;
  String? get weightUnit => _$this._weightUnit;
  set weightUnit(String? weightUnit) => _$this._weightUnit = weightUnit;

  String? _pictureUrl;
  String? get pictureUrl => _$this._pictureUrl;
  set pictureUrl(String? pictureUrl) => _$this._pictureUrl = pictureUrl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PetsRecordBuilder() {
    PetsRecord._initializeBuilder(this);
  }

  PetsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _birthdate = $v.birthdate;
      _breed = $v.breed;
      _condition = $v.condition;
      _name = $v.name;
      _ownerName = $v.ownerName;
      _ownerUid = $v.ownerUid;
      _sex = $v.sex;
      _weight = $v.weight;
      _weightUnit = $v.weightUnit;
      _pictureUrl = $v.pictureUrl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PetsRecord;
  }

  @override
  void update(void Function(PetsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PetsRecord build() => _build();

  _$PetsRecord _build() {
    final _$result = _$v ??
        new _$PetsRecord._(
            birthdate: birthdate,
            breed: breed,
            condition: condition,
            name: name,
            ownerName: ownerName,
            ownerUid: ownerUid,
            sex: sex,
            weight: weight,
            weightUnit: weightUnit,
            pictureUrl: pictureUrl,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
