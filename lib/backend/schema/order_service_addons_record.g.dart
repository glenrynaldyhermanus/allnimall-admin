// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_service_addons_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderServiceAddonsRecord> _$orderServiceAddonsRecordSerializer =
    new _$OrderServiceAddonsRecordSerializer();

class _$OrderServiceAddonsRecordSerializer
    implements StructuredSerializer<OrderServiceAddonsRecord> {
  @override
  final Iterable<Type> types = const [
    OrderServiceAddonsRecord,
    _$OrderServiceAddonsRecord
  ];
  @override
  final String wireName = 'OrderServiceAddonsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OrderServiceAddonsRecord object,
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
    value = object.serviceUid;
    if (value != null) {
      result
        ..add('service_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.addOnUid;
    if (value != null) {
      result
        ..add('add_on_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  OrderServiceAddonsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderServiceAddonsRecordBuilder();

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
        case 'service_uid':
          result.serviceUid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'add_on_uid':
          result.addOnUid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$OrderServiceAddonsRecord extends OrderServiceAddonsRecord {
  @override
  final String? name;
  @override
  final double? fee;
  @override
  final DocumentReference<Object?>? serviceUid;
  @override
  final DocumentReference<Object?>? addOnUid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderServiceAddonsRecord(
          [void Function(OrderServiceAddonsRecordBuilder)? updates]) =>
      (new OrderServiceAddonsRecordBuilder()..update(updates))._build();

  _$OrderServiceAddonsRecord._(
      {this.name, this.fee, this.serviceUid, this.addOnUid, this.ffRef})
      : super._();

  @override
  OrderServiceAddonsRecord rebuild(
          void Function(OrderServiceAddonsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderServiceAddonsRecordBuilder toBuilder() =>
      new OrderServiceAddonsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderServiceAddonsRecord &&
        name == other.name &&
        fee == other.fee &&
        serviceUid == other.serviceUid &&
        addOnUid == other.addOnUid &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), fee.hashCode), serviceUid.hashCode),
            addOnUid.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderServiceAddonsRecord')
          ..add('name', name)
          ..add('fee', fee)
          ..add('serviceUid', serviceUid)
          ..add('addOnUid', addOnUid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderServiceAddonsRecordBuilder
    implements
        Builder<OrderServiceAddonsRecord, OrderServiceAddonsRecordBuilder> {
  _$OrderServiceAddonsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _fee;
  double? get fee => _$this._fee;
  set fee(double? fee) => _$this._fee = fee;

  DocumentReference<Object?>? _serviceUid;
  DocumentReference<Object?>? get serviceUid => _$this._serviceUid;
  set serviceUid(DocumentReference<Object?>? serviceUid) =>
      _$this._serviceUid = serviceUid;

  DocumentReference<Object?>? _addOnUid;
  DocumentReference<Object?>? get addOnUid => _$this._addOnUid;
  set addOnUid(DocumentReference<Object?>? addOnUid) =>
      _$this._addOnUid = addOnUid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderServiceAddonsRecordBuilder() {
    OrderServiceAddonsRecord._initializeBuilder(this);
  }

  OrderServiceAddonsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _fee = $v.fee;
      _serviceUid = $v.serviceUid;
      _addOnUid = $v.addOnUid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderServiceAddonsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderServiceAddonsRecord;
  }

  @override
  void update(void Function(OrderServiceAddonsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderServiceAddonsRecord build() => _build();

  _$OrderServiceAddonsRecord _build() {
    final _$result = _$v ??
        new _$OrderServiceAddonsRecord._(
            name: name,
            fee: fee,
            serviceUid: serviceUid,
            addOnUid: addOnUid,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
