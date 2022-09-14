// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServicesStruct> _$servicesStructSerializer =
    new _$ServicesStructSerializer();

class _$ServicesStructSerializer
    implements StructuredSerializer<ServicesStruct> {
  @override
  final Iterable<Type> types = const [ServicesStruct, _$ServicesStruct];
  @override
  final String wireName = 'ServicesStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServicesStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'addOns',
      serializers.serialize(object.addOns,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AddOnsStruct)])),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fee;
    if (value != null) {
      result
        ..add('fee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.numOfPets;
    if (value != null) {
      result
        ..add('numOfPets')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ServicesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServicesStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fee':
          result.fee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'numOfPets':
          result.numOfPets = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'addOns':
          result.addOns.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AddOnsStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$ServicesStruct extends ServicesStruct {
  @override
  final String? name;
  @override
  final double? fee;
  @override
  final int? numOfPets;
  @override
  final BuiltList<AddOnsStruct> addOns;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ServicesStruct([void Function(ServicesStructBuilder)? updates]) =>
      (new ServicesStructBuilder()..update(updates))._build();

  _$ServicesStruct._(
      {this.name,
      this.fee,
      this.numOfPets,
      required this.addOns,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(addOns, r'ServicesStruct', 'addOns');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ServicesStruct', 'firestoreUtilData');
  }

  @override
  ServicesStruct rebuild(void Function(ServicesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServicesStructBuilder toBuilder() =>
      new ServicesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServicesStruct &&
        name == other.name &&
        fee == other.fee &&
        numOfPets == other.numOfPets &&
        addOns == other.addOns &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), fee.hashCode), numOfPets.hashCode),
            addOns.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServicesStruct')
          ..add('name', name)
          ..add('fee', fee)
          ..add('numOfPets', numOfPets)
          ..add('addOns', addOns)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ServicesStructBuilder
    implements Builder<ServicesStruct, ServicesStructBuilder> {
  _$ServicesStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _fee;
  double? get fee => _$this._fee;
  set fee(double? fee) => _$this._fee = fee;

  int? _numOfPets;
  int? get numOfPets => _$this._numOfPets;
  set numOfPets(int? numOfPets) => _$this._numOfPets = numOfPets;

  ListBuilder<AddOnsStruct>? _addOns;
  ListBuilder<AddOnsStruct> get addOns =>
      _$this._addOns ??= new ListBuilder<AddOnsStruct>();
  set addOns(ListBuilder<AddOnsStruct>? addOns) => _$this._addOns = addOns;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ServicesStructBuilder() {
    ServicesStruct._initializeBuilder(this);
  }

  ServicesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _fee = $v.fee;
      _numOfPets = $v.numOfPets;
      _addOns = $v.addOns.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServicesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServicesStruct;
  }

  @override
  void update(void Function(ServicesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServicesStruct build() => _build();

  _$ServicesStruct _build() {
    _$ServicesStruct _$result;
    try {
      _$result = _$v ??
          new _$ServicesStruct._(
              name: name,
              fee: fee,
              numOfPets: numOfPets,
              addOns: addOns.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'ServicesStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'addOns';
        addOns.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServicesStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
