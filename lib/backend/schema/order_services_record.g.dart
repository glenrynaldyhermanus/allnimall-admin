// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_services_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderServicesRecord> _$orderServicesRecordSerializer =
    new _$OrderServicesRecordSerializer();

class _$OrderServicesRecordSerializer
    implements StructuredSerializer<OrderServicesRecord> {
  @override
  final Iterable<Type> types = const [
    OrderServicesRecord,
    _$OrderServicesRecord
  ];
  @override
  final String wireName = 'OrderServicesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OrderServicesRecord object,
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
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.serviceUid;
    if (value != null) {
      result
        ..add('service_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.addOns;
    if (value != null) {
      result
        ..add('add_ons')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AddOnsStruct)])));
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
  OrderServicesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderServicesRecordBuilder();

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
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'service_uid':
          result.serviceUid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'add_ons':
          result.addOns.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AddOnsStruct)]))!
              as BuiltList<Object?>);
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

class _$OrderServicesRecord extends OrderServicesRecord {
  @override
  final String? name;
  @override
  final double? fee;
  @override
  final int? quantity;
  @override
  final DocumentReference<Object?>? serviceUid;
  @override
  final BuiltList<AddOnsStruct>? addOns;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderServicesRecord(
          [void Function(OrderServicesRecordBuilder)? updates]) =>
      (new OrderServicesRecordBuilder()..update(updates))._build();

  _$OrderServicesRecord._(
      {this.name,
      this.fee,
      this.quantity,
      this.serviceUid,
      this.addOns,
      this.ffRef})
      : super._();

  @override
  OrderServicesRecord rebuild(
          void Function(OrderServicesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderServicesRecordBuilder toBuilder() =>
      new OrderServicesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderServicesRecord &&
        name == other.name &&
        fee == other.fee &&
        quantity == other.quantity &&
        serviceUid == other.serviceUid &&
        addOns == other.addOns &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), fee.hashCode),
                    quantity.hashCode),
                serviceUid.hashCode),
            addOns.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderServicesRecord')
          ..add('name', name)
          ..add('fee', fee)
          ..add('quantity', quantity)
          ..add('serviceUid', serviceUid)
          ..add('addOns', addOns)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderServicesRecordBuilder
    implements Builder<OrderServicesRecord, OrderServicesRecordBuilder> {
  _$OrderServicesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _fee;
  double? get fee => _$this._fee;
  set fee(double? fee) => _$this._fee = fee;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  DocumentReference<Object?>? _serviceUid;
  DocumentReference<Object?>? get serviceUid => _$this._serviceUid;
  set serviceUid(DocumentReference<Object?>? serviceUid) =>
      _$this._serviceUid = serviceUid;

  ListBuilder<AddOnsStruct>? _addOns;
  ListBuilder<AddOnsStruct> get addOns =>
      _$this._addOns ??= new ListBuilder<AddOnsStruct>();
  set addOns(ListBuilder<AddOnsStruct>? addOns) => _$this._addOns = addOns;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderServicesRecordBuilder() {
    OrderServicesRecord._initializeBuilder(this);
  }

  OrderServicesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _fee = $v.fee;
      _quantity = $v.quantity;
      _serviceUid = $v.serviceUid;
      _addOns = $v.addOns?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderServicesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderServicesRecord;
  }

  @override
  void update(void Function(OrderServicesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderServicesRecord build() => _build();

  _$OrderServicesRecord _build() {
    _$OrderServicesRecord _$result;
    try {
      _$result = _$v ??
          new _$OrderServicesRecord._(
              name: name,
              fee: fee,
              quantity: quantity,
              serviceUid: serviceUid,
              addOns: _addOns?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'addOns';
        _addOns?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrderServicesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
