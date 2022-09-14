// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_ons_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddOnsRecord> _$addOnsRecordSerializer =
    new _$AddOnsRecordSerializer();

class _$AddOnsRecordSerializer implements StructuredSerializer<AddOnsRecord> {
  @override
  final Iterable<Type> types = const [AddOnsRecord, _$AddOnsRecord];
  @override
  final String wireName = 'AddOnsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddOnsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
    value = object.isActive;
    if (value != null) {
      result
        ..add('is_active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.sequence;
    if (value != null) {
      result
        ..add('sequence')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  AddOnsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddOnsRecordBuilder();

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
        case 'is_active':
          result.isActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sequence':
          result.sequence = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$AddOnsRecord extends AddOnsRecord {
  @override
  final String? name;
  @override
  final double? fee;
  @override
  final bool? isActive;
  @override
  final int? sequence;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AddOnsRecord([void Function(AddOnsRecordBuilder)? updates]) =>
      (new AddOnsRecordBuilder()..update(updates))._build();

  _$AddOnsRecord._(
      {this.name, this.fee, this.isActive, this.sequence, this.ffRef})
      : super._();

  @override
  AddOnsRecord rebuild(void Function(AddOnsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddOnsRecordBuilder toBuilder() => new AddOnsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddOnsRecord &&
        name == other.name &&
        fee == other.fee &&
        isActive == other.isActive &&
        sequence == other.sequence &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), fee.hashCode), isActive.hashCode),
            sequence.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddOnsRecord')
          ..add('name', name)
          ..add('fee', fee)
          ..add('isActive', isActive)
          ..add('sequence', sequence)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AddOnsRecordBuilder
    implements Builder<AddOnsRecord, AddOnsRecordBuilder> {
  _$AddOnsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _fee;
  double? get fee => _$this._fee;
  set fee(double? fee) => _$this._fee = fee;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  int? _sequence;
  int? get sequence => _$this._sequence;
  set sequence(int? sequence) => _$this._sequence = sequence;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AddOnsRecordBuilder() {
    AddOnsRecord._initializeBuilder(this);
  }

  AddOnsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _fee = $v.fee;
      _isActive = $v.isActive;
      _sequence = $v.sequence;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddOnsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddOnsRecord;
  }

  @override
  void update(void Function(AddOnsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddOnsRecord build() => _build();

  _$AddOnsRecord _build() {
    final _$result = _$v ??
        new _$AddOnsRecord._(
            name: name,
            fee: fee,
            isActive: isActive,
            sequence: sequence,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
