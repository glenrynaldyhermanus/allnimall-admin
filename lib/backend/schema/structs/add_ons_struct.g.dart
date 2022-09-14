// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_ons_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddOnsStruct> _$addOnsStructSerializer =
    new _$AddOnsStructSerializer();

class _$AddOnsStructSerializer implements StructuredSerializer<AddOnsStruct> {
  @override
  final Iterable<Type> types = const [AddOnsStruct, _$AddOnsStruct];
  @override
  final String wireName = 'AddOnsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddOnsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
    return result;
  }

  @override
  AddOnsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddOnsStructBuilder();

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

class _$AddOnsStruct extends AddOnsStruct {
  @override
  final String? name;
  @override
  final double? fee;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$AddOnsStruct([void Function(AddOnsStructBuilder)? updates]) =>
      (new AddOnsStructBuilder()..update(updates))._build();

  _$AddOnsStruct._({this.name, this.fee, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'AddOnsStruct', 'firestoreUtilData');
  }

  @override
  AddOnsStruct rebuild(void Function(AddOnsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddOnsStructBuilder toBuilder() => new AddOnsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddOnsStruct &&
        name == other.name &&
        fee == other.fee &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, name.hashCode), fee.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddOnsStruct')
          ..add('name', name)
          ..add('fee', fee)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class AddOnsStructBuilder
    implements Builder<AddOnsStruct, AddOnsStructBuilder> {
  _$AddOnsStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _fee;
  double? get fee => _$this._fee;
  set fee(double? fee) => _$this._fee = fee;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  AddOnsStructBuilder() {
    AddOnsStruct._initializeBuilder(this);
  }

  AddOnsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _fee = $v.fee;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddOnsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddOnsStruct;
  }

  @override
  void update(void Function(AddOnsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddOnsStruct build() => _build();

  _$AddOnsStruct _build() {
    final _$result = _$v ??
        new _$AddOnsStruct._(
            name: name,
            fee: fee,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'AddOnsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
